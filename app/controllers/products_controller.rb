# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_admin, only: [:edit, :update]

  def index
    @products = Product.all.with_attached_avatar
    @users = User.all
  end

  def show
    @user = User.all
    if current_user.nil?
      flash.now[:alert] = "Il faut créer un compte si vous voulez acheter ou louer une oeuvre ! #{view_context.link_to("S'inscrire", new_user_registration_path)}".html_safe
    elsif current_user.first_name.nil? || current_user.last_name.nil? || current_user.adress.nil? || current_user.city.nil? || current_user.phone_number.nil?
      flash.now[:alert] = "Il faut modifier votre profil pour acheter ou louer une oeuvre ! #{view_context.link_to(' Modifier', edit_user_registration_path)}".html_safe 
    end
  end

  def new
    @product = Product.new
  end

  def create
    if current_user.check_profile_completed?
      redirect_to edit_user_registration_path
    else
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
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Votre oeuvre a été modifiée"
      redirect_to products_path
    end
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


  def authenticate_admin
    @product = Product.find(params[:id])
    unless @product.admin == current_user
      flash[:danger] = "Accès refusé"
      redirect_to root_path
    end
  end
end
