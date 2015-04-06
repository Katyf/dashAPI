require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  setup do
    @setting = settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settings)
  end

  test "should create setting" do
    assert_difference('Setting.count') do
      post :create, setting: { User_id: @setting.User_id, feeds: @setting.feeds, themes: @setting.themes }
    end

    assert_response 201
  end

  test "should show setting" do
    get :show, id: @setting
    assert_response :success
  end

  test "should update setting" do
    put :update, id: @setting, setting: { User_id: @setting.User_id, feeds: @setting.feeds, themes: @setting.themes }
    assert_response 204
  end

  test "should destroy setting" do
    assert_difference('Setting.count', -1) do
      delete :destroy, id: @setting
    end

    assert_response 204
  end
end
