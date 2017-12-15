require 'test_helper'

class WeeklogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weeklog = weeklogs(:one)
  end

  test "should get index" do
    get weeklogs_url
    assert_response :success
  end

  test "should get new" do
    get new_weeklog_url
    assert_response :success
  end

  test "should create weeklog" do
    assert_difference('Weeklog.count') do
      post weeklogs_url, params: { weeklog: { end_date_code: @weeklog.end_date_code, incentive_total: @weeklog.incentive_total, losses: @weeklog.losses, start_date_code: @weeklog.start_date_code, weekly_incentive: @weeklog.weekly_incentive, wins: @weeklog.wins } }
    end

    assert_redirected_to weeklog_url(Weeklog.last)
  end

  test "should show weeklog" do
    get weeklog_url(@weeklog)
    assert_response :success
  end

  test "should get edit" do
    get edit_weeklog_url(@weeklog)
    assert_response :success
  end

  test "should update weeklog" do
    patch weeklog_url(@weeklog), params: { weeklog: { end_date_code: @weeklog.end_date_code, incentive_total: @weeklog.incentive_total, losses: @weeklog.losses, start_date_code: @weeklog.start_date_code, weekly_incentive: @weeklog.weekly_incentive, wins: @weeklog.wins } }
    assert_redirected_to weeklog_url(@weeklog)
  end

  test "should destroy weeklog" do
    assert_difference('Weeklog.count', -1) do
      delete weeklog_url(@weeklog)
    end

    assert_redirected_to weeklogs_url
  end
end
