class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :user_name
      t.string :email
      t.string :address
      t.string :address2
      t.string :pref
      t.string :city
      t.integer :zip
      t.string :credit_name
      t.bigint :credit_number
      t.integer :credit_expiration
      t.integer :credit_cvv

      t.timestamps
    end
  end
end
