class UsersController < ApplicationController
    before_action :is_it_you?, only: [:show, :edit, :update]  
    before_action :set_user
   
    def show
      @user = User.find(params[:id])
    end

    def edit
        
    end

    def update  
      if params[:commit] == 'ARTISTE'
        @user.update(artist: true)
        redirect_to users_owner_path
      elsif params[:commit] == 'ART LOVER'
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
    Product.all.each do |product| 
      if product.admin_id == @user.id
  
      elsif @user.id != current_user.id
        redirect_to user_path(current_user)
      end
    end
end

end
