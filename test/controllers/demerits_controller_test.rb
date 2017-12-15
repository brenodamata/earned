require 'test_helper'

class DemeritsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demerit = demerits(:one)
  end

  test "should get index" do
    get demerits_url
    assert_response :success
  end

  test "should get new" do
    get new_demerit_url
    assert_response :success
  end

  test "should create demerit" do
    assert_difference('Demerit.count') do
      post demerits_url, params: { demerit: { name: @demerit.name } }
    end

    assert_redirected_to demerit_url(Demerit.last)
  end

  test "should show demerit" do
    get demerit_url(@demerit)
    assert_response :success
  end

  test "should get edit" do
    get edit_demerit_url(@demerit)
    assert_response :success
  end

  test "should update demerit" do
    patch demerit_url(@demerit), params: { demerit: { name: @demerit.name } }
    assert_redirected_to demerit_url(@demerit)
  end

  test "should destroy demerit" do
    assert_difference('Demerit.count', -1) do
      delete demerit_url(@demerit)
    end

    assert_redirected_to demerits_url
  end
end
