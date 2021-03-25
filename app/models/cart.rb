# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :line_products
  has_many :products, through: :line_products
  belongs_to :user, optional: true

  def sub_total
    line_products.pluck(:price).sum
  end
end
