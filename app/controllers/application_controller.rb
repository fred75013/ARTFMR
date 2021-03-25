# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart
  before_action :renting_time_over?

  private

  def renting_time_over?
    OrderProduct.all.each do |order|
      next if order.end_date.nil?

      if order.end_date < Date.today
        order.product.update(status: "available")
      end
    end

    # available_products = OrderProduct.where("? > date", :created_at, date: Date.today)
    # available_products.update_all(status: "available")
  end

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if user_signed_in?
        cart.update(user_id: current_user.id)
      end
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end
      if session[:cart_id].nil?
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
  end

  def after_sign_in_path_for(_resource_or_scope)
    if @user.first_name = !current_user.first_name
      edit_user_url(current_user)
    else
      "/"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :nickname, :first_name, :last_name, :adress, :city, :phone_number, :artist, :current_password) }
  end
end
