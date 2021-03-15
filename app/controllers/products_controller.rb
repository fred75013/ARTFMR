class ProductsController < ApplicationController
    
      def index
        @products = Product.all.with_attached_avatar
      end
    
      def new
        @product = Product.new
      end
    
      def create
        @product = Product.create(product_params)
        @product.avatar.attach(params[:avatar])
        redirect_to products_path
      end
    
      def edit
        @product = Product.find(params[:id])
      end
    
      def update
        @product = Product.find(params[:id])
        @product.update(product_params)
        redirect_to products_path
      end
    
      def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
      end
    
      private
        def product_params
          params.require(:product).permit(:title, :description, :category, :type, :height, :width, :depth, :weight, :border_product, :authenticable_product, :price)
        end
end
