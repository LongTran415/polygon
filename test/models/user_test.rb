require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  # Fixtures:
  #   username: long
  #   email: long@gmail.com
  #   password: long

  # User.authenticate(params[:user])
  # ex: {username: 'name', password: 'password'}
  #
  #
  test "#authenticate: it returns true when login is correct" do
    assert true == User.authenticate({username: 'long', password: 'long'})
  end

  test "#authenticate: it returns false when login is incorrect" do
    assert false == User.authenticate({username: 'bleh', password: 'bleh'})
  end

  test "#authenticate: it returns false when given valid username but password is incorrect" do
    assert false == User.authenticate({username: 'long', password: 'bleh'})
  end

  test "#authenticate: it returns false when called without args" do
    assert false == User.authenticate()
  end
end
