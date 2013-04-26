require 'test_helper'

class OutstockItemsControllerTest < ActionController::TestCase
  setup do
    @outstock_item = outstock_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outstock_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outstock_item" do
    assert_difference('OutstockItem.count') do
      post :create, outstock_item: { outstock_id: @outstock_item.outstock_id, product_id: @outstock_item.product_id, spec_bh: @outstock_item.spec_bh, spec_id: @outstock_item.spec_id }
    end

    assert_redirected_to outstock_item_path(assigns(:outstock_item))
  end

  test "should show outstock_item" do
    get :show, id: @outstock_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outstock_item
    assert_response :success
  end

  test "should update outstock_item" do
    put :update, id: @outstock_item, outstock_item: { outstock_id: @outstock_item.outstock_id, product_id: @outstock_item.product_id, spec_bh: @outstock_item.spec_bh, spec_id: @outstock_item.spec_id }
    assert_redirected_to outstock_item_path(assigns(:outstock_item))
  end

  test "should destroy outstock_item" do
    assert_difference('OutstockItem.count', -1) do
      delete :destroy, id: @outstock_item
    end

    assert_redirected_to outstock_items_path
  end
end
