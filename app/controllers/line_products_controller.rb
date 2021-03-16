class LineProductsController < ApplicationController
  def index
    @line_product = LineProduct.all
  end
  
  def new
    LineProduct.new
  end

  def create
  # Find associated product and current cart
  chosen_product = Product.find(params[:product_id])
  
  current_cart = @current_cart

  if current_cart.products.include?(chosen_product)
    # Find the line_item with the chosen_product
    @line_product = current_cart.line_products.find_by(:product_id => chosen_product)
    redirect_to request.referrer
    flash[:notice] = "Déja ajouté au panier"

  else
    @line_product = LineProduct.new(cart: current_cart, product: chosen_product, price: chosen_product.price  )

    @line_product.save
    redirect_to cart_path(current_cart)
  end

  # Save and redirect to cart show path
  
  
end
      

  def update
    @line_product = LineProduct.find(params[:id]) 
    #@line_product.product.map(&:price)=50
    if @line_product.to_buy == false
        @line_product.update(to_buy: true, price: @line_product.product.price)       
    else
        @line_product.update(to_buy: false, price: 50) 
    end
  end


  def destroy
    @line_product = LineProduct.find(params[:id])
    @line_product.destroy
    redirect_to cart_path(@current_cart)
  end  

    
end
