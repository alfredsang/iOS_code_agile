require 'test_helper'

class ScanningsControllerTest < ActionController::TestCase
  setup do
    @scanning = scannings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scannings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scanning" do
    assert_difference('Scanning.count') do
      post :create, scanning: { scanDate: @scanning.scanDate, scanTitle: @scanning.scanTitle, scanUrl: @scanning.scanUrl }
    end

    assert_redirected_to scanning_path(assigns(:scanning))
  end

  test "should show scanning" do
    get :show, id: @scanning
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scanning
    assert_response :success
  end

  test "should update scanning" do
    put :update, id: @scanning, scanning: { scanDate: @scanning.scanDate, scanTitle: @scanning.scanTitle, scanUrl: @scanning.scanUrl }
    assert_redirected_to scanning_path(assigns(:scanning))
  end

  test "should destroy scanning" do
    assert_difference('Scanning.count', -1) do
      delete :destroy, id: @scanning
    end

    assert_redirected_to scannings_path
  end
end
