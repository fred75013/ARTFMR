class OrderProductsController < ApplicationController
  def update
    @order_product = OrderProduct.find(params[:id])
    if @order_product.order.user == current_user && @order_product.artist_confirmation != "validated"
      @order_product.update(customer_confirmation: "validated")
    end
    if @order_product.product.admin == current_user && @order_product.order.user != "validated"
      @order_product.update(artist_confirmation: "validated")
    end
    if @order_product.order.user == current_user && @order_product.artist_confirmation == "validated"
      @order_product.update(start_date: Date.today, end_date: Date.today.advance(days: 30))
    end
    if @order_product.product.admin == current_user && @order_product.order.user == "validated"
      @order_product.update(start_date: Date.today, end_date: Date.today.advance(days: 30))
    end
    redirect_to request.referrer
  end

  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order_product.destroy
    redirect_to request.referrer
    flash[:notice] = "Commande annulé"
  end
end
