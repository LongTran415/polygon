require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get entries_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_url
    assert_response :success
  end

  test "should not create entry unless logged in" do
    assert_no_difference("Entry.count") do
      post entries_url, params: { entry: { body: @entry.body, title: @entry.title } }
    end

    assert_select "#error_explanation" do
      assert_select "li", "User must exist"
    end

  end

  test "should create entry unless logged in" do
    login!
    assert_difference('Entry.count') do
      post entries_url, params: { entry: { body: @entry.body, title: @entry.title } }
    end

    assert_redirected_to entry_url(Entry.last)
  end

  test "should show entry" do
    get entry_url(@entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_url(@entry)
    assert_response :success
  end

  test "should not update entry when not logged in" do
    patch entry_url(@entry), params: { entry: { body: @entry.body, title: @entry.title } }

    assert_select "#error_explanation" do
      assert_select "li", "User must exist"
    end

  end

  test "should update entry when logged in" do
    login!
    patch entry_url(@entry), params: { entry: { body: @entry.body, title: @entry.title } }
    assert_redirected_to entry_url(@entry)
  end


  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry)
    end

    assert_redirected_to entries_url
  end
end
