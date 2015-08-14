require 'test_helper'

class ZipCodesControllerTest < ActionController::TestCase
  setup do
    @zip_code = zip_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zip_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zip_code" do
    assert_difference('ZipCode.count') do
      post :create, zip_code: { city: @zip_code.city, county: @zip_code.county, latitude: @zip_code.latitude, longitude: @zip_code.longitude, state_id: @zip_code.state_id, zip: @zip_code.zip }
    end

    assert_redirected_to zip_code_path(assigns(:zip_code))
  end

  test "should show zip_code" do
    get :show, id: @zip_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zip_code
    assert_response :success
  end

  test "should update zip_code" do
    patch :update, id: @zip_code, zip_code: { city: @zip_code.city, county: @zip_code.county, latitude: @zip_code.latitude, longitude: @zip_code.longitude, state_id: @zip_code.state_id, zip: @zip_code.zip }
    assert_redirected_to zip_code_path(assigns(:zip_code))
  end

  test "should destroy zip_code" do
    assert_difference('ZipCode.count', -1) do
      delete :destroy, id: @zip_code
    end

    assert_redirected_to zip_codes_path
  end
end
