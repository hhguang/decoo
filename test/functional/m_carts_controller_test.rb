require 'test_helper'

class MCartsControllerTest < ActionController::TestCase
  setup do
    @m_cart = m_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:m_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create m_cart" do
    assert_difference('MCart.count') do
      post :create, m_cart: {  }
    end

    assert_redirected_to m_cart_path(assigns(:m_cart))
  end

  test "should show m_cart" do
    get :show, id: @m_cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @m_cart
    assert_response :success
  end

  test "should update m_cart" do
    put :update, id: @m_cart, m_cart: {  }
    assert_redirected_to m_cart_path(assigns(:m_cart))
  end

  test "should destroy m_cart" do
    assert_difference('MCart.count', -1) do
      delete :destroy, id: @m_cart
    end

    assert_redirected_to m_carts_path
  end
end
