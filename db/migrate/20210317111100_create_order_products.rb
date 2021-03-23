# frozen_string_literal: true

class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :renting_time
      t.string :artist_confirmation
      t.string :status
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
