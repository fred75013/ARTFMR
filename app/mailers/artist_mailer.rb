class ArtistMailer < ApplicationMailer
    default from: 'artfmr.heroku@gmail.com'
  
    def order_confirmation(order)
      @order = order
      @cart = @order.user.cart
      @tab = []
      @url  = 'https://artfmr.herokuapp.com/'
      @user = User.find(order.user_id)
      order.order_products.each do |order_product|
        @tab << order_product.admin.email
      end 
      @tab = @tab.uniq

      @tab.each do |email_artist|
      @email_artist = email_artist
      mail(to: email_artist, subject: 'confirmation de commande')
      
      end

    end
  
end
