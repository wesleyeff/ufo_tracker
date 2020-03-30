require 'test_helper'

class SightingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sighting = sightings(:one)
  end

  test "should get index" do
    get sightings_url, as: :json
    assert_response :success
  end

  test "should create sighting" do
    assert_difference('Sighting.count') do
      post sightings_url, params: { sighting: { city: @sighting.city, comments: @sighting.comments, duration_seconds: @sighting.duration_seconds, latitude: @sighting.latitude, longitude: @sighting.longitude, shape: @sighting.shape, sighted_at: @sighting.sighted_at, state: @sighting.state } }, as: :json
    end

    assert_response 201
  end

  test "should show sighting" do
    get sighting_url(@sighting), as: :json
    assert_response :success
  end

  test "should update sighting" do
    patch sighting_url(@sighting), params: { sighting: { city: @sighting.city, comments: @sighting.comments, duration_seconds: @sighting.duration_seconds, latitude: @sighting.latitude, longitude: @sighting.longitude, shape: @sighting.shape, sighted_at: @sighting.sighted_at, state: @sighting.state } }, as: :json
    assert_response 200
  end

  test "should destroy sighting" do
    assert_difference('Sighting.count', -1) do
      delete sighting_url(@sighting), as: :json
    end

    assert_response 204
  end
end
