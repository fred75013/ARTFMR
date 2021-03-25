# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :is_it_you?, only: [:show, :edit, :update]
  before_action :set_user
  

  def show; end

  def edit; end

  def destroy; end

  def update
    case params[:commit]
    when 'ARTISTE'
      @user.update(artist: true)
      redirect_to users_owner_path
    when 'ART LOVER'
      @user.update(artist: false)
      redirect_to users_taker_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def is_it_you?
    @user = User.find(params[:id])

    if @user.artist == true
    elsif @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

end
