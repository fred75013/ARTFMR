class UsersController < ApplicationController
    
   
   
    def show
        @user = current_user
    
    end

    def update
       @user = current_user
       
       if params[:commit] == 'ARTISTE'
        @user.update(artist: true)
       elsif params[:commit] == 'ART LOVER'
        @user.update(artist: false)   
       end
    end


end
