# frozen_string_literal: true

class PurchasedProduct < ApplicationRecord
  belongs_to :customer
end
