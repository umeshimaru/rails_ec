class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :code
      t.integer :discount_amount
      t.references :customer,  foreign_key: true

      t.timestamps
    end
  end
end
