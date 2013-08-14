require 'test_helper'

class GoodsStocksControllerTest < ActionController::TestCase
  setup do
    @goods_stock = goods_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods_stock" do
    assert_difference('GoodsStock.count') do
      post :create, goods_stock: { bh: @goods_stock.bh, memo: @goods_stock.memo, name: @goods_stock.name, quantity: @goods_stock.quantity }
    end

    assert_redirected_to goods_stock_path(assigns(:goods_stock))
  end

  test "should show goods_stock" do
    get :show, id: @goods_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goods_stock
    assert_response :success
  end

  test "should update goods_stock" do
    put :update, id: @goods_stock, goods_stock: { bh: @goods_stock.bh, memo: @goods_stock.memo, name: @goods_stock.name, quantity: @goods_stock.quantity }
    assert_redirected_to goods_stock_path(assigns(:goods_stock))
  end

  test "should destroy goods_stock" do
    assert_difference('GoodsStock.count', -1) do
      delete :destroy, id: @goods_stock
    end

    assert_redirected_to goods_stocks_path
  end
end
