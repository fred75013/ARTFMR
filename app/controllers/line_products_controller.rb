# frozen_string_literal: true

class LineProductsController < ApplicationController
  before_action :check_product_presence, only: [:create]
  # before_action :set_create, only: [:create, :index]

  def index
    @line_product = LineProduct.all
  end

  def new
    LineProduct.new
  end

  def create
    chosen_product = Product.find(params[:id])

    if chosen_product.status == "sold" || chosen_product.status == "rented"
      redirect_to request.referrer
      flash[:notice] = "Ce produit est indisponible"
    else
      @line_product = LineProduct.new(cart: @current_cart, product: chosen_product, price: chosen_product.price )

      @line_product.save
      redirect_to cart_path(@current_cart)
    end
    # Save and redirect to cart show path
  end

  def update
    @line_product = LineProduct.find(params[:id])
    # @line_product.product.map(&:price)=50
    if @line_product.to_buy == false
      @line_product.update(to_buy: true, price: @line_product.product.price)
    else
      @line_product.update(to_buy: false, price: 50)
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

  # before action create

  def set_create
    # Find associated product and current cart
  end
end
