# frozen_string_literal: true

module CustomersHelper
  def full_name(last_name, first_name)
    "#{last_name}#{first_name}"
  end
end
