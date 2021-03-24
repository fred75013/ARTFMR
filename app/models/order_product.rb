# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  after_create :order_confirmation_artist

  def order_confirmation_artist
    ArtistMailer.order_confirmation(self).deliver_now
  end
end
