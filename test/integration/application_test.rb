require 'test_helper'

class ApplicationTest < ActionDispatch::IntegrationTest
  test "it has a home button that links sto root_path" do
    get root_path
    assert_select "a.home", "Polygon"
  end
end
