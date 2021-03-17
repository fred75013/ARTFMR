class Product < ApplicationRecord
  has_many :line_products, dependent: :destroy
  has_many :order_products
  has_many :orders, through: :order_products
  has_one_attached :avatar

  validates :avatar,
  presence: false
  
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
  numericality: { only_integer: true, greater_than: 70 }
  

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
  presence: false
  
  validates :authenticable_product, 
  presence: false
  
  validates :status, 
  presence: true

  validates :to_rent, 
  presence: false

  validates :to_buy, 
  presence: false
  
  validates :price, 
  presence: true,
  numericality: { only_integer: true, greater_than: 399 }

  validates :image_url, 
  presence: false
  
end
