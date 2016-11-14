require 'test_helper'

class LoginFlowTest < ActionDispatch::IntegrationTest

  test "can see the login button on homepage" do
    get "/"
    # respec method, it grabs a webpage and aserts to see if it exist
    assert_select "a.login", "Login" do
      assert_select "[href=?]", new_session_path
    end
  end

  test "we see a input for username in the login page" do
    get new_session_path
    assert_select "input.name" do
      assert_select "[name=?]", "user[name]"
    end
  end

  test "we can see a inpit for password on the login page" do
    get new_session_path
    assert_select "input.password" do
      assert_select "[name=?]", "user[password]"
      assert_select "[type=?]", "password"
    end
  end

  test "we have a form that posts to session" do
    get new_session_path
    assert_select "form" do
      assert_select "[action=?]", sessions_path
    end
  end

  test "we have a submit button" do
    get new_session_path
      assert_select "input[type=?]", "submit" do
        assert_select  "[value=?]", "Login"
      end
  end

  test "when logging in with invaild user, you are redirected to new_session_path" do
    post sessions_path, params: invalid_user_params
    assert_redirected_to new_session_path
  end

  test "when loggin in with invaild username or passsword, you see an error message after redirect" do
    post sessions_path, params: invalid_user_params
    follow_redirect!
    assert_select "#error_explanation" do
      assert_select 'p', "Invalid username or password..."
    end
  end


  test "when logging in with valid user, we are redirected to root_path" do
    post sessions_path, params: valid_user_params
    assert_redirected_to root_path
  end

  test "when logging in, the Login button changes to Logout" do
    login!
    assert_select "a.logout", "Logout"
  end

  test "when logging out, you are redirected to sessions_new page" do
    login!
    delete sessions_path
    assert_redirected_to new_session_path
  end


  test "when logged out, the logout button changes to login" do
    login!
    delete sessions_path
    follow_redirect!
    assert_select "a.login", "Login"
  end

  test "when logged out, there is no new entry button" do
    get root_path
    assert_select "a.new-entry", false
  end

  test "when logged in, there is a new entry button" do
    login!
    get root_path
    assert_select "a.new-entry", "New Entry"
  end
end
