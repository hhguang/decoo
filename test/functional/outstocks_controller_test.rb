require 'test_helper'

class OutstocksControllerTest < ActionController::TestCase
  setup do
    @outstock = outstocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outstocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outstock" do
    assert_difference('Outstock.count') do
      post :create, outstock: { memo: @outstock.memo, taker: @outstock.taker, user_id: @outstock.user_id }
    end

    assert_redirected_to outstock_path(assigns(:outstock))
  end

  test "should show outstock" do
    get :show, id: @outstock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outstock
    assert_response :success
  end

  test "should update outstock" do
    put :update, id: @outstock, outstock: { memo: @outstock.memo, taker: @outstock.taker, user_id: @outstock.user_id }
    assert_redirected_to outstock_path(assigns(:outstock))
  end

  test "should destroy outstock" do
    assert_difference('Outstock.count', -1) do
      delete :destroy, id: @outstock
    end

    assert_redirected_to outstocks_path
  end
end
