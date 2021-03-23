# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  has_many :line_products
  has_many :products, through: :line_products
  after_create :order_confirmation

  def order_confirmation
    UserMailer.order_confirmation(self).deliver_now
    ArtistMailer.order_confirmation(self).deliver_now

  end
end
