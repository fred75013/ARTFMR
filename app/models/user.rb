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

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_confirmation_of :password

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
