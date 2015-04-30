require 'test_helper'

class ConsultanciesControllerTest < ActionController::TestCase
  setup do
    @consultancy = consultancies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultancies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultancy" do
    assert_difference('Consultancy.count') do
      post :create, consultancy: { approved: @consultancy.approved, body: @consultancy.body, consaltant_id: @consultancy.consaltant_id, pitch_id: @consultancy.pitch_id }
    end

    assert_redirected_to consultancy_path(assigns(:consultancy))
  end

  test "should show consultancy" do
    get :show, id: @consultancy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consultancy
    assert_response :success
  end

  test "should update consultancy" do
    patch :update, id: @consultancy, consultancy: { approved: @consultancy.approved, body: @consultancy.body, consaltant_id: @consultancy.consaltant_id, pitch_id: @consultancy.pitch_id }
    assert_redirected_to consultancy_path(assigns(:consultancy))
  end

  test "should destroy consultancy" do
    assert_difference('Consultancy.count', -1) do
      delete :destroy, id: @consultancy
    end

    assert_redirected_to consultancies_path
  end
end
