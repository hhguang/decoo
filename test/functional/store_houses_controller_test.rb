require 'test_helper'

class StoreHousesControllerTest < ActionController::TestCase
  setup do
    @store_house = store_houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_house" do
    assert_difference('StoreHouse.count') do
      post :create, store_house: { name: @store_house.name }
    end

    assert_redirected_to store_house_path(assigns(:store_house))
  end

  test "should show store_house" do
    get :show, id: @store_house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_house
    assert_response :success
  end

  test "should update store_house" do
    put :update, id: @store_house, store_house: { name: @store_house.name }
    assert_redirected_to store_house_path(assigns(:store_house))
  end

  test "should destroy store_house" do
    assert_difference('StoreHouse.count', -1) do
      delete :destroy, id: @store_house
    end

    assert_redirected_to store_houses_path
  end
end
