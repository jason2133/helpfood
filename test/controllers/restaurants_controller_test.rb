require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { doromyeong: @restaurant.doromyeong, gunmul_bunho1: @restaurant.gunmul_bunho1, gunmul_bunho2: @restaurant.gunmul_bunho2, integer: @restaurant.integer, integer: @restaurant.integer, phone_number: @restaurant.phone_number, restaurant_name: @restaurant.restaurant_name, sido: @restaurant.sido, sigungu: @restaurant.sigungu, string: @restaurant.string, string: @restaurant.string, string: @restaurant.string, string: @restaurant.string, string: @restaurant.string } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { doromyeong: @restaurant.doromyeong, gunmul_bunho1: @restaurant.gunmul_bunho1, gunmul_bunho2: @restaurant.gunmul_bunho2, integer: @restaurant.integer, integer: @restaurant.integer, phone_number: @restaurant.phone_number, restaurant_name: @restaurant.restaurant_name, sido: @restaurant.sido, sigungu: @restaurant.sigungu, string: @restaurant.string, string: @restaurant.string, string: @restaurant.string, string: @restaurant.string, string: @restaurant.string } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_url
  end
end
