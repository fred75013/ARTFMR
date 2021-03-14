class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :type
      t.integer :height
      t.integer :width
      t.integer :depth
      t.integer :weight
      t.boolean :border_product
      t.boolean :authenticable_product
      t.integer :price
      t.string :image_url

      t.timestamps
    end
  end
end
