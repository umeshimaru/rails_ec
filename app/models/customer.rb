class Customer < ApplicationRecord
    has_many :purchased_products
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :last_name,         presence: true
    validates :first_name,        presence: true
    validates :user_name,         presence: true
    validates :email,             presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :address,           presence: true
    validates :pref,              presence: true
    validates :city,              presence: true
    validates :zip,               presence: true,length: { is: 7 }
    validates :credit_name,       presence: true
    validates :credit_number,presence: true,length: { is: 16 }
    validates :credit_expiration, presence: true,length: { is: 4 }
    validates :credit_cvv, presence: true,   length: { is: 3 }
  
  
end
