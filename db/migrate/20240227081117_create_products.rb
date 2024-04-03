# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :product_code
      t.text :description
      t.timestamps
    end
    add_index :products, :name, unique: true
    add_index :products, :product_code, unique: true
  end
end
