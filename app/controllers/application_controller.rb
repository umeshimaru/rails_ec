# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :basic_auth

  def basic_auth
    if Rails.env == "development"
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['ADMIN'] && password == ENV['BASIC_PASSWORD']
      end
    end
  end

end
