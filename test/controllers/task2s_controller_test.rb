require 'test_helper'

class Task2sControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get task2s_create_url
    assert_response :success
  end

  test "should get destroy" do
    get task2s_destroy_url
    assert_response :success
  end

end
