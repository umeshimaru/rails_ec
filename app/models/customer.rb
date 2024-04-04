class Customer < ApplicationRecord
  has_many :cart_products
  has_many :products, through: :cart_products


def self.new_token
  SecureRandom.urlsafe_base64
end


end
