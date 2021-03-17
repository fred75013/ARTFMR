class CheckoutController < ApplicationController

    def create
        if current_user.first_name == nil && current_user.last_name == nil && current_user.adress == nil && current_user.city == nil && current_user.phone_number == nil && current_user.artist == nil
            redirect_to edit_user_registration_path
        else
        @user = current_user
        @total = params[:total].to_d
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [
                {
                    name: "Rails Stripe Checkout",
                    amount: (@total*100).to_i,
                    currency: 'eur',
                    quantity: 1,
                },
            ],
            success_url: root_url + "?session_id={CHECKOUT_SESSION_ID}",
            cancel_url: root_url,
        )
        respond_to do |format|
            format.js # renders create.js.erb
        end
    end
    
    def success
      @session = Stripe::Checkout::Session.retrieve(params[:session_id])
      @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
      
    end
    
    @cart = @current_cart
      @order = Order.create(cart_id: @cart.id , amount: @cart.sub_total, user_id: current_user.id)
  
      @cart.products.each do |product|
          OrderProduct.create(product_id: product.id, order_id: @order.id)    
      end
  
       @cart.line_products.each do |line|
         if line.to_buy == true 
          line.update(order_id: @order.id )
          line.product.update(status: "sold")
         else
          line.update(order_id: @order.id )
          line.product.update(status: "rented")
         end
      end

        def cancel 
            @session = Stripe::Checkout::Session.retrieve(params[:session_id])
            @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
        end
end
end

