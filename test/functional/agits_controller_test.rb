require 'test_helper'

class AgitsControllerTest < ActionController::TestCase
  setup do
    @agit = agits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agit" do
    assert_difference('Agit.count') do
      post :create, agit: { description: @agit.description, image: @agit.image, name: @agit.name }
    end

    assert_redirected_to agit_path(assigns(:agit))
  end

  test "should show agit" do
    get :show, id: @agit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agit
    assert_response :success
  end

  test "should update agit" do
    put :update, id: @agit, agit: { description: @agit.description, image: @agit.image, name: @agit.name }
    assert_redirected_to agit_path(assigns(:agit))
  end

  test "should destroy agit" do
    assert_difference('Agit.count', -1) do
      delete :destroy, id: @agit
    end

    assert_redirected_to agits_path
  end
end
