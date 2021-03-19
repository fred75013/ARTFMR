# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :authenticate_user

  def create
    if current_user.first_name.nil? || current_user.last_name.nil? || current_user.adress.nil? || current_user.city.nil? || current_user.phone_number.nil?
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

      @cart = @current_cart

      @order = Order.create(cart_id: @cart.id, amount: @cart.sub_total, user_id: current_user.id)

      @cart.line_products.each do |line|
        if line.to_buy == true
          line.update(order_id: @order.id )
          line.product.update(status: "sold")
        else
          line.update(order_id: @order.id )
          line.product.update(status: "rented")
        end
      end

      @cart.products.each do |product|
        if product.status == "sold"
          OrderProduct.create(product_id: product.id, order_id: @order.id)
        else
          OrderProduct.create(product_id: product.id, order_id: @order.id, start_date: Time.now, end_date: Time.now.advance(days: 30))
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
