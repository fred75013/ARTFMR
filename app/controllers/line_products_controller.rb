# frozen_string_literal: true

class LineProductsController < ApplicationController
  before_action :check_product_presence, only: [:create]

  def index
    @line_product = LineProduct.all
  end

  def new
    LineProduct.new
  end

  def create
    chosen_product = Product.find(params[:id])

    @line_product = if chosen_product.status == "rented"
                      LineProduct.new(cart: @current_cart, product: chosen_product, price: chosen_product.price - (50 * chosen_product.order_products.last.renting_time) )
                    else
                      LineProduct.new(cart: @current_cart, product: chosen_product, price: chosen_product.price )
                    end
    if @line_product.save
      redirect_to products_path
      flash[:success] = "Bien ajouté au panier"
    end
    # Save and redirect to cart show path
  end

  def update
    @line_product = LineProduct.find(params[:id])
    # @line_product.product.map(&:price)=50
    if @line_product.to_buy
      @line_product.update(to_buy: false, price: 50)
    elsif @line_product.to_buy == false && @line_product.product.status == "rented"
      @line_product.update(to_buy: true, price: @line_product.product.price - (50 * @line_product.product.order_products.last.renting_time))
    else
      @line_product.update(to_buy: true, price: @line_product.product.price)
    end
    redirect_to request.referrer
  end

  def destroy
    @line_product = LineProduct.find(params[:id])
    @line_product.destroy
    redirect_to cart_path(@current_cart)
  end

  private

  def check_product_presence
    chosen_product = Product.find(params[:id])
    if @current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @line_product = @current_cart.line_products.find_by(product_id: chosen_product)
      redirect_to request.referrer
      flash[:notice] = "Déja ajouté au panier"
    end
  end
end
