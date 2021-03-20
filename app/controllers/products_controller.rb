# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :edit_profil, only: [:new, :create]
  before_action :authenticate_admin, only: [:edit, :update]
  

  def index
    @products = Product.all.with_attached_avatar
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.admin = current_user
    if @product.save
      flash[:notice] = "Votre oeuvre est en ligne"
      redirect_to products_path
    else
      puts "$" * 30
      puts "error message"
      puts "$" * 30
      render :new
    end
  end

  def edit; end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :category, :style, :height, :width, :depth, :weight, :border_product, :authenticable_product, :price, :avatar, status: "available")
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def edit_profil
    if current_user.first_name.nil? || current_user.last_name.nil? || current_user.adress.nil? || current_user.city.nil? || current_user.phone_number.nil?
      redirect_to edit_user_registration_path
    end
  end

  def authenticate_admin
    @product = Product.find(params[:id])
    unless @product.admin == current_user
      flash[:danger] = "Accès refusé"
      redirect_to root_path
    end
  end
  
end
