# frozen_string_literal: true

class User < ApplicationRecord
  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_one :cart
  has_many :likes, dependent: :destroy

  has_one_attached :avatar

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_confirmation_of :password

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def incomplete_profile?
    first_name.nil? || last_name.nil? || adress.nil? || city.nil? || phone_number.nil?
  end

end
