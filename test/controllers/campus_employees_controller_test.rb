require 'test_helper'

class CampusEmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get campus_employees_index_url
    assert_response :success
  end

  test "should get show" do
    get campus_employees_show_url
    assert_response :success
  end

  test "should get new" do
    get campus_employees_new_url
    assert_response :success
  end

  test "should get edit" do
    get campus_employees_edit_url
    assert_response :success
  end

  test "should get update" do
    get campus_employees_update_url
    assert_response :success
  end

  test "should get destroy" do
    get campus_employees_destroy_url
    assert_response :success
  end

end
