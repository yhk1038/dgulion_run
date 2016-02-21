require 'test_helper'

class CommenderControllerTest < ActionController::TestCase
  test "should get service_input" do
    get :service_input
    assert_response :success
  end

  test "should get service_save" do
    get :service_save
    assert_response :success
  end

  test "should get service_delete" do
    get :service_delete
    assert_response :success
  end

  test "should get service_modify" do
    get :service_modify
    assert_response :success
  end

  test "should get service_update" do
    get :service_update
    assert_response :success
  end

end
