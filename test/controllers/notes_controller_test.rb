require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @note = notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should create note" do
    assert_difference('Note.count') do
      post :create, note: { User_id: @note.User_id, text: @note.text }
    end

    assert_response 201
  end

  test "should show note" do
    get :show, id: @note
    assert_response :success
  end

  test "should update note" do
    put :update, id: @note, note: { User_id: @note.User_id, text: @note.text }
    assert_response 204
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, id: @note
    end

    assert_response 204
  end
end
