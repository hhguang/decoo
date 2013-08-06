require 'test_helper'

class GoodsCategoriesControllerTest < ActionController::TestCase
  setup do
    @goods_category = goods_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods_category" do
    assert_difference('GoodsCategory.count') do
      post :create, goods_category: { limite: @goods_category.limite, name: @goods_category.name, parent_id: @goods_category.parent_id }
    end

    assert_redirected_to goods_category_path(assigns(:goods_category))
  end

  test "should show goods_category" do
    get :show, id: @goods_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goods_category
    assert_response :success
  end

  test "should update goods_category" do
    put :update, id: @goods_category, goods_category: { limite: @goods_category.limite, name: @goods_category.name, parent_id: @goods_category.parent_id }
    assert_redirected_to goods_category_path(assigns(:goods_category))
  end

  test "should destroy goods_category" do
    assert_difference('GoodsCategory.count', -1) do
      delete :destroy, id: @goods_category
    end

    assert_redirected_to goods_categories_path
  end
end
