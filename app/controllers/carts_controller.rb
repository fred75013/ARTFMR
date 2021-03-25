# frozen_string_literal: true
class CartsController < ApplicationController
  def show
    @current_cart
  end
  
  def update; end

  def destroy
    @current_cart
    @current_cart.products.destroy_all

    redirect_to cart_path
  end
end
