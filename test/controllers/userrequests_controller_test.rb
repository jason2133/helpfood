require 'test_helper'

class UserrequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userrequests_index_url
    assert_response :success
  end

  test "should get new" do
    get userrequests_new_url
    assert_response :success
  end

  test "should get ask" do
    get userrequests_ask_url
    assert_response :success
  end

end
