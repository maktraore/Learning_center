require 'test_helper'

class EmployeeTimeSlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_time_slots_index_url
    assert_response :success
  end

  test "should get show" do
    get employee_time_slots_show_url
    assert_response :success
  end

  test "should get new" do
    get employee_time_slots_new_url
    assert_response :success
  end

  test "should get edit" do
    get employee_time_slots_edit_url
    assert_response :success
  end

  test "should get update" do
    get employee_time_slots_update_url
    assert_response :success
  end

  test "should get destroy" do
    get employee_time_slots_destroy_url
    assert_response :success
  end

end
