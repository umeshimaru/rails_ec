# frozen_string_literal: true

class CreatePurchasedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :purchased_products do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.text :description
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
