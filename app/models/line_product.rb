class LineProduct < ApplicationRecord
    belongs_to :product
    belongs_to :cart
    

  
  def total_price
    1 * self.product.price
  end

end
