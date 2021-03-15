class LineProductsController < ApplicationController
  def index
    # Find associated product and current cart
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart
  
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @line_product = current_cart.line_products.find_by(:product_id => chosen_product)
      
      redirect_to cart_path(current_cart)
      flash[:notice] = "Déja ajouté au panier"
    else
      @line_product = LineProduct.new
      @line_product.cart = current_cart
      @line_product.product = chosen_product
      @line_product.price = chosen_product.price
    end
  
    # Save and redirect to cart show path
    @line_product.save
    redirect_to cart_path(current_cart)
  end
  
  
       def create
        # Find associated product and current cart
        chosen_product = Product.find(params[:product_id])
        
        current_cart = @current_cart
      
        if current_cart.products.include?(chosen_product)
          # Find the line_item with the chosen_product
          @line_product = current_cart.line_products.find_by(:product_id => chosen_product)
          redirect_to cart_path(current_cart)
          flash[:notice] = "Déja ajouté au panier"

        else
          @line_product = LineProduct.new
          
          @line_product.cart = current_cart
          @line_product.product = chosen_product
          @line_product.price = chosen_product.price
          
          
        end
      
        # Save and redirect to cart show path
        @line_product.save
        redirect_to cart_path(current_cart)
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
