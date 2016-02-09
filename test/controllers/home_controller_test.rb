require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get intro" do
    get :intro
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get menu1" do
    get :menu1
    assert_response :success
  end

end
