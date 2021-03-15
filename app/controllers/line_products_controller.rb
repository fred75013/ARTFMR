class LineProductsController < ApplicationController
    def create
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
        end
      
        # Save and redirect to cart show path
        @line_product.save
        redirect_to cart_path(current_cart)
      end

      def destroy
        @line_product = LineProduct.find(params[:id])
        @line_product.destroy
        redirect_to cart_path(@current_cart)
      end  

    
end
