class Order < ApplicationRecord
    belongs_to :cart
    belongs_to :user
    has_many :order_products
    has_many :products, through: :order_products
    has_many :line_products
    has_many :products, through: :line_products
end
