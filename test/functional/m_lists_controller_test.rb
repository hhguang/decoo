require 'test_helper'

class MListsControllerTest < ActionController::TestCase
  setup do
    @m_list = m_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:m_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create m_list" do
    assert_difference('MList.count') do
      post :create, m_list: {  }
    end

    assert_redirected_to m_list_path(assigns(:m_list))
  end

  test "should show m_list" do
    get :show, id: @m_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @m_list
    assert_response :success
  end

  test "should update m_list" do
    put :update, id: @m_list, m_list: {  }
    assert_redirected_to m_list_path(assigns(:m_list))
  end

  test "should destroy m_list" do
    assert_difference('MList.count', -1) do
      delete :destroy, id: @m_list
    end

    assert_redirected_to m_lists_path
  end
end
