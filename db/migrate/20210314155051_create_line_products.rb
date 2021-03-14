class CreateLineProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :line_products do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity
      t.integer :order_id

      t.timestamps
    end
  end
end
