require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  setup do
    @link = links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test "should create link" do
    assert_difference('Link.count') do
      post :create, link: { User_id: @link.User_id, url: @link.url }
    end

    assert_response 201
  end

  test "should show link" do
    get :show, id: @link
    assert_response :success
  end

  test "should update link" do
    put :update, id: @link, link: { User_id: @link.User_id, url: @link.url }
    assert_response 204
  end

  test "should destroy link" do
    assert_difference('Link.count', -1) do
      delete :destroy, id: @link
    end

    assert_response 204
  end
end
