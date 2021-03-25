class OrderProductsController < ApplicationController
  before_action :find_order_product

  def update
    if @order_product.artist_confirmation != "validated"
      @order_product.update(artist_confirmation: "validated", start_date: Date.today, end_date: Date.today.advance(days: 30))
    end
    redirect_to request.referrer
  end

  def destroy
    @order_product.destroy
    redirect_to request.referrer
    flash[:notice] = "Commande annulée"
  end

  def find_order_product
    @order_product = OrderProduct.find(params[:id])
  end
end
