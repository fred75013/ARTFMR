class Order < ApplicationRecord
    belongs_to :cart
    belongs_to :user
    has_many :order_products
    has_many :products, through: :order_products
end
