class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :cart
      t.integer :amount

      t.timestamps
    end
  end
end
