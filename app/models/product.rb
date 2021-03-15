class Product < ApplicationRecord
  has_many :line_products, dependent: :destroy
  
  
  validates :title, 
  presence: true,
  length: { in: 5..140 }

  validates :description, 
  presence: true,
  length: { in: 20..400 }

  validates :category, 
  presence: true
  
  validates :style, 
  presence: true
  
  validates :height, 
  presence: true,
  numericality: { only_integer: true, greater_than: 70 },
  length: { in: 5..140 }

  validates :width, 
  presence: true,
  numericality: { only_integer: true, greater_than: 70}
  

  validates :depth, 
  presence: true,
  numericality: { only_integer: true }
  

  validates :weight, 
  presence: true,
  numericality: { only_integer: true }

  validates :border_product, 
  presence: true
  
  validates :authenticable_product, 
  presence: true
  
  validates :status, 
  presence: true

  validates :to_rent, 
  presence: true

  validates :to_buy, 
  presence: true
  
  validates :price, 
  presence: true,
  numericality: { only_integer: true, greater_than: 400 }

  validates :image_url, 
  presence: false
  
end
