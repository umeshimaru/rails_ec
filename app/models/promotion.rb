class Promotion < ApplicationRecord
  belongs_to :customer , optional: true
end
