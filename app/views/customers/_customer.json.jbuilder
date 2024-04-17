json.extract! customer, :id, :last_name, :first_name, :user_name, :email, :address, :address2, :pref, :city, :zip, :credit_name, :credit_number, :credit_expiration, :credit_cvv, :created_at, :updated_at
json.url customer_url(customer, format: :json)
