class ArtistMailer < ApplicationMailer
    default from: 'artfmr.heroku@gmail.com'
  
    def order_confirmation(order_product)
      @order_product = order_product
      @url  = 'https://artfmr.herokuapp.com/'
      @user = User.find(order_product.order.user_id)
      @artist = order_product.product.admin
      @product = order_product.product
      mail(to: @artist.email, subject: 'confirmation de commande')
      
      
    end

    def new_product(product)
        @product = product
        @artist = User.find(product.admin.id)
        @url  = 'https://artfmr.herokuapp.com/'
        mail(to: @artist.email, subject: 'nouveau produit créer')
    end

  
end
