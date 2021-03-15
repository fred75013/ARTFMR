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
      t.string :status
      t.boolean :to_rent
      t.boolean :to_buy
      t.integer :price
      t.string :image_url

      t.timestamps
    end
  end
end
