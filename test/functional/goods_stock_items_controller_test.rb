require 'test_helper'

class GoodsStockItemsControllerTest < ActionController::TestCase
  setup do
    @goods_stock_item = goods_stock_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods_stock_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods_stock_item" do
    assert_difference('GoodsStockItem.count') do
      post :create, goods_stock_item: { goods_stock_id: @goods_stock_item.goods_stock_id, memo: @goods_stock_item.memo, quantity: @goods_stock_item.quantity, type: @goods_stock_item.type, user_id: @goods_stock_item.user_id }
    end

    assert_redirected_to goods_stock_item_path(assigns(:goods_stock_item))
  end

  test "should show goods_stock_item" do
    get :show, id: @goods_stock_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goods_stock_item
    assert_response :success
  end

  test "should update goods_stock_item" do
    put :update, id: @goods_stock_item, goods_stock_item: { goods_stock_id: @goods_stock_item.goods_stock_id, memo: @goods_stock_item.memo, quantity: @goods_stock_item.quantity, type: @goods_stock_item.type, user_id: @goods_stock_item.user_id }
    assert_redirected_to goods_stock_item_path(assigns(:goods_stock_item))
  end

  test "should destroy goods_stock_item" do
    assert_difference('GoodsStockItem.count', -1) do
      delete :destroy, id: @goods_stock_item
    end

    assert_redirected_to goods_stock_items_path
  end
end
