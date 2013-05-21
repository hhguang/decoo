require 'test_helper'

class PordersControllerTest < ActionController::TestCase
  setup do
    @porder = porders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:porders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create porder" do
    assert_difference('Porder.count') do
      post :create, porder: { name: @porder.name, outstock_id: @porder.outstock_id, quantity: @porder.quantity, toy_id: @porder.toy_id, user_id: @porder.user_id }
    end

    assert_redirected_to porder_path(assigns(:porder))
  end

  test "should show porder" do
    get :show, id: @porder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @porder
    assert_response :success
  end

  test "should update porder" do
    put :update, id: @porder, porder: { name: @porder.name, outstock_id: @porder.outstock_id, quantity: @porder.quantity, toy_id: @porder.toy_id, user_id: @porder.user_id }
    assert_redirected_to porder_path(assigns(:porder))
  end

  test "should destroy porder" do
    assert_difference('Porder.count', -1) do
      delete :destroy, id: @porder
    end

    assert_redirected_to porders_path
  end
end
