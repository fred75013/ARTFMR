class AdminController < ApplicationController
  before_action :authenticate_user
  before_action :admin

  def index
    @products = Product.all.with_attached_avatar
    @users = User.all
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Vous n'êtes pas l'administrateur de ce compte"
      redirect_to new_user_session_path
    end
  end

  def admin
    if current_user.admin == false
      redirect_to root_path
    end
  end
end
