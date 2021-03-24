# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :authenticate_user


  def create
    if current_user.incomplete_profile?
      redirect_to edit_user_registration_path
    else
      @user = current_user
      @total = params[:total].to_d
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          {
            name: "Rails Stripe Checkout",
            amount: (@total * 100).to_i,
            currency: 'eur',
            quantity: 1,
          },
        ],
        success_url: "#{checkout_success_url}?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: root_url,
      )
      respond_to do |format|
        format.js # renders create.js.erb
      end

    end

    def success
      @session = Stripe::Checkout::Session.retrieve(params[:session_id])
      @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
      flash[:notice] = "Tu peux envoyer un message a l'artiste depuis ton profil"
      @cart = @current_cart
      
      @order = Order.create(cart_id: @cart.id, amount: @cart.sub_total, user_id: current_user.id)
   
      @cart.line_products.each do |line|
        if line.to_buy == true && line.product.status == "available"
          line.product.update(status: "sold")
          OrderProduct.create(product_id: line.product.id, order_id: @order.id, status: "sold")

        elsif line.to_buy == false && line.product.status == "available"
          line.product.update(status: "rented")
          line.update(order_id: @order.id )
          OrderProduct.create(product_id: line.product.id, order_id: @order.id, renting_time: 1, status: "rent" )

        elsif line.to_buy == true && line.product.status == "rented"
          line.product.update(status: "sold")
          line.product.order_products.last.update(status: "sold")

        elsif line.to_buy == false && line.product.status == "rented"
          line.product.order_products.last.update(end_date: line.product.order_products.last.end_date.advance(days: 30), renting_time: line.product.order_products.last.renting_time + 1, status: "rent")

        end
      end

      @cart.products.destroy_all
    end

    def cancel
      @session = Stripe::Checkout::Session.retrieve(params[:session_id])
      @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "enregistre toi avant"
      redirect_to new_user_session_path
    end
  end
end
