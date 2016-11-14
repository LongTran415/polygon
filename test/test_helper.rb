ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def invalid_user_params
    # invalid_user_params object:
    {
      user: {
        name: "blah",
        password: "blah"
      }
    }
  end

  def password
    "punk"
  end

  def valid_user_params
    # valid_user_params object:
    {
      user: {
        name: users(:two).name,
        password: password
      }
    }
  end

  def login!
    post sessions_path, params: valid_user_params
    follow_redirect!
  end

end
