# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :line_products, dependent: :destroy
  has_many :order_products
  has_many :orders, through: :order_products
  has_one_attached :avatar
  belongs_to :admin, class_name: "User"
  has_many :likes, dependent: :destroy
  after_create :new_product

  validates :avatar,
            presence: false

  validates :title,
            presence: true,
            length: { in: 5..140 }

  validates :description,
            presence: true,
            length: { in: 20..250 }

  validates :category,
            presence: true

  validates :style,
            presence: true

  validates :height,
            presence: true,
            numericality: { only_integer: true, greater_than: 69 }

  validates :width,
            presence: true,
            numericality: { only_integer: true, greater_than: 69 }

  validates :depth,
            presence: true,
            numericality: { only_integer: true }

  validates :weight,
            presence: true,
            numericality: { only_integer: true }

  # validates :border_product,
  # presence: false

  # validates :authenticable_product,
  # presence: false

  validates :status,
            presence: true

  validates :price,
            presence: true,
            numericality: { only_integer: true, greater_than: 399 }

  validates :image_url,
            presence: false

  def new_product
    ArtistMailer.new_product(self).deliver_now
  end

end
