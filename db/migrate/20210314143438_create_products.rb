# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :style
      t.integer :height
      t.integer :width
      t.integer :depth
      t.integer :weight
      t.boolean :border_product
      t.boolean :authenticable_product
      t.string :status, default: "Available"
      t.integer :price
      t.string :image_url
      t.belongs_to :admin, index: true, null: false, class_name: "User"

      t.timestamps
    end
  end
end
