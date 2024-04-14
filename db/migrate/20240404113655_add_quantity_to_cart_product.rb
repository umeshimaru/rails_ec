# frozen_string_literal: true

class AddQuantityToCartProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_products, :quantity, :integer
  end
end
