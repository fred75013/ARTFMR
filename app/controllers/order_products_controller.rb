class OrderProductsController < ApplicationController
  def update
    @order_product = OrderProduct.find(params[:id])
    if @order_product.artist_confirmation != "validated"
      @order_product.update(artist_confirmation: "validated", start_date: Date.today, end_date: Date.today.advance(days: 30))
    end
    redirect_to request.referrer
  end

  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order_product.destroy
    redirect_to request.referrer
    flash[:notice] = "Commande annulée"
  end
end
