require 'test_helper'

class HouseStocksControllerTest < ActionController::TestCase
  setup do
    @house_stock = house_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:house_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house_stock" do
    assert_difference('HouseStock.count') do
      post :create, house_stock: { goods_stock_id: @house_stock.goods_stock_id, quantity: @house_stock.quantity, store_house_id: @house_stock.store_house_id }
    end

    assert_redirected_to house_stock_path(assigns(:house_stock))
  end

  test "should show house_stock" do
    get :show, id: @house_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house_stock
    assert_response :success
  end

  test "should update house_stock" do
    put :update, id: @house_stock, house_stock: { goods_stock_id: @house_stock.goods_stock_id, quantity: @house_stock.quantity, store_house_id: @house_stock.store_house_id }
    assert_redirected_to house_stock_path(assigns(:house_stock))
  end

  test "should destroy house_stock" do
    assert_difference('HouseStock.count', -1) do
      delete :destroy, id: @house_stock
    end

    assert_redirected_to house_stocks_path
  end
end
