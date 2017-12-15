require 'test_helper'

class DaylogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daylog = daylogs(:one)
  end

  test "should get index" do
    get daylogs_url
    assert_response :success
  end

  test "should get new" do
    get new_daylog_url
    assert_response :success
  end

  test "should create daylog" do
    assert_difference('Daylog.count') do
      post daylogs_url, params: { daylog: { date_code: @daylog.date_code, incentive_total: @daylog.incentive_total, strikes: @daylog.strikes, win: @daylog.win } }
    end

    assert_redirected_to daylog_url(Daylog.last)
  end

  test "should show daylog" do
    get daylog_url(@daylog)
    assert_response :success
  end

  test "should get edit" do
    get edit_daylog_url(@daylog)
    assert_response :success
  end

  test "should update daylog" do
    patch daylog_url(@daylog), params: { daylog: { date_code: @daylog.date_code, incentive_total: @daylog.incentive_total, strikes: @daylog.strikes, win: @daylog.win } }
    assert_redirected_to daylog_url(@daylog)
  end

  test "should destroy daylog" do
    assert_difference('Daylog.count', -1) do
      delete daylog_url(@daylog)
    end

    assert_redirected_to daylogs_url
  end
end
