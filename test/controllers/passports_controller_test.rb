require 'test_helper'

class PassportsControllerTest < ActionController::TestCase
  setup do
    @passport = passports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:passports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create passport" do
    assert_difference('Passport.count') do
      post :create, passport: { lastupdated: @passport.lastupdated, passport: @passport.passport }
    end

    assert_redirected_to passport_path(assigns(:passport))
  end

  test "should show passport" do
    get :show, id: @passport
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @passport
    assert_response :success
  end

  test "should update passport" do
    patch :update, id: @passport, passport: { lastupdated: @passport.lastupdated, passport: @passport.passport }
    assert_redirected_to passport_path(assigns(:passport))
  end

  test "should destroy passport" do
    assert_difference('Passport.count', -1) do
      delete :destroy, id: @passport
    end

    assert_redirected_to passports_path
  end
end
