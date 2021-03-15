class Cart < ApplicationRecord
  has_many :line_products, dependent: :destroy
  has_many :products, through: :line_products

  def sub_total
    sum = 0
    self.line_products.each do |line_product|
      sum+= line_product.total_price
    end
    return sum
  end
end
