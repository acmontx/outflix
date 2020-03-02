require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contents_index_url
    assert_response :success
  end

  test "should get show" do
    get contents_show_url
    assert_response :success
  end

  test "should get edit" do
    get contents_edit_url
    assert_response :success
  end

end
