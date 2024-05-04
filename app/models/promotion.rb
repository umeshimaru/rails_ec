# frozen_string_literal: true

class Promotion < ApplicationRecord
  belongs_to :customer, optional: true
end
