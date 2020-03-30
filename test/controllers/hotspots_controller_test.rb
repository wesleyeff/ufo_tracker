require 'test_helper'

class HotspotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotspot = hotspots(:one)
  end

  test "should get index" do
    get hotspots_url, as: :json
    assert_response :success
  end

  test "should create hotspot" do
    assert_difference('Hotspot.count') do
      post hotspots_url, params: { hotspot: { latitude: @hotspot.latitude, longitude: @hotspot.longitude, name: @hotspot.name } }, as: :json
    end

    assert_response 201
  end

  test "should show hotspot" do
    get hotspot_url(@hotspot), as: :json
    assert_response :success
  end

  test "should update hotspot" do
    patch hotspot_url(@hotspot), params: { hotspot: { latitude: @hotspot.latitude, longitude: @hotspot.longitude, name: @hotspot.name } }, as: :json
    assert_response 200
  end

  test "should destroy hotspot" do
    assert_difference('Hotspot.count', -1) do
      delete hotspot_url(@hotspot), as: :json
    end

    assert_response 204
  end
end
