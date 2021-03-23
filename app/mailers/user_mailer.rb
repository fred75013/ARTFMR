# frozen_string_literal: true
# ApplicationMailer 
class UserMailer <  Devise::Mailer
  default from: 'artfmr.heroku@gmail.com'

  def welcome_email(user)
    # on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    # on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://artfmr.herokuapp.com/'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def order_confirmation(order)
    @order = order
    @cart = @order.user.cart
    @user = User.find(order.user_id)
    @url  = 'https://artfmr.herokuapp.com/'
    mail(to: @user.email, subject: 'confirmation de commande')
  end

  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'users/mailer' # to make sure that your mailer uses the devise views

  def welcome_reset_password_instructions(user)
    create_reset_password_token(user)
    mail(to: user.email, subject: 'Bienvenue chez nous !')
  end

  private

  def create_reset_password_token(user)
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    @token = raw
    user.reset_password_token = hashed
    user.reset_password_sent_at = Time.now.utc
    user.save
  end
end

