require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  def valid_user
    { username: users(:two).username, password: users(:two).password }
  end

  def invalid_user_and_pass
    { username: "bleh", password: "blop" }
  end

  def valid_user_and_invalid_pass
    { username: users(:two).username, password: "blop" }
  end
  
  # Fixtures:
  #   username: long
  #   email: long@gmail.com
  #   password: long

  # User.authenticate(params[:user])
  # ex: {username: 'name', password: 'password'}
  #

  test "#authenticate: it returns User when login is correct" do
    expected_user = User.find_by(username: valid_user[:username])
    assert expected_user == User.authenticate(valid_user)
  end

  test "#authenticate: it returns false when login is incorrect" do
    assert false == User.authenticate(invalid_user_and_pass)
  end

  test "#authenticate: it returns false when given valid username but password is incorrect" do
    assert false == User.authenticate(valid_user_and_invalid_pass)
  end

  test "#authenticate: it returns false when called without args" do
    assert false == User.authenticate()
  end


end
