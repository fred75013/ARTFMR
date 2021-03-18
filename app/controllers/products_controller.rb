class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy] 
      
      def index
        @products = Product.all.with_attached_avatar
      end

      def show        
      end
    
      def new
        @product = Product.new
      end
    
      def create
        @product = Product.create(product_params)        
        redirect_to products_path
      end
    
      def edit  
      end
    
      def update
        @product.update(product_params)
        redirect_to products_path
      end
    
      def destroy
        @product.destroy
        redirect_to products_path
      end
    
      private

        def product_params
          params.require(:product).permit(:title, :description, :category, :style, :height, :width, :depth, :weight, :border_product, :authenticable_product, :price, :avatar, status: "Available")
        end

      def set_product
        @product = Product.find(params[:id])
      end
end
