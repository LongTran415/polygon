
require 'test_helper'

class RegistrationFlowTest < ActionDispatch::IntegrationTest
  test "it shows a register link if not logged in" do
    get root_path
    assert_select "a.register", "Register" do
      assert_select "[href=?]", new_user_path
    end
  end

  test "it shows no reister link if logged in" do
    login!
    get root_path
    assert_select "a.register", false
  end
end
