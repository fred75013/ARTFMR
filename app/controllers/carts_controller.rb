class CartsController < ApplicationController
  
  
 
  def show
    @cart = @current_cart
   
  end

  def update
  end

  def destroy
    @cart = @current_cart
    @cart.products.destroy_all
    
    
    redirect_to root_path
  end

 

end
