
require 'test_helper'

class RegistrationFlowTest < ActionDispatch::IntegrationTest

  def valid_password_params
    {
      user: {
        name: "Joe",
        email: "joe@gmail.com",
        password: "joe",
        password_confirmation: "joe"
      }
    }
  end

  def invalid_password_params
    {
      user: {
        name: "Joe",
        email: "joe@gmail.com",
        password: "joe",
        password_confirmation: "blah"
      }
    }
  end

  test "it has the correct form elements" do
    get new_user_path
    assert_select "input[name=?]", "user[name]"
    assert_select "input[name=?]", "user[email]"
    assert_select "input[name=?]", "user[password]" do
      assert_select "[type=?]", "password"
    end
    assert_select "input[name=?]", "user[password_confirmation]" do
      assert_select "[type=?]", "password"
    end
  end

  test "it shows a register link if not logged in" do
    get root_path
    assert_select "a.register", "Register" do
      assert_select "[href=?]", new_user_path
    end
  end

  test "it shows no register link if logged in" do
    login!
    get root_path
    assert_select "a.register", false
  end

  test "it redirects to root_path if valid creation" do
    post users_path, params: valid_password_params
    assert_redirected_to root_path
  end

  test "it shows appropriate error message if password and password confrimation do not match" do
    post users_path, params: invalid_password_params
    assert_select "#error_explanation" do
      assert_select 'li', "Password confirmation doesn't match Password"
    end
  end

end
