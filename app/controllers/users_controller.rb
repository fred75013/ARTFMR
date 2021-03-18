class UsersController < ApplicationController
    
   
   
    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
    @user = User.find(params[:id])
       
    if params[:commit] == 'ARTISTE'
     @user.update(artist: true)
     redirect_to users_owner_path
    elsif params[:commit] == 'ART LOVER'
     @user.update(artist: false) 
     redirect_to users_taker_path  
    end
    end
end
