require 'test_helper'

class EmployeeSubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_subjects_index_url
    assert_response :success
  end

  test "should get show" do
    get employee_subjects_show_url
    assert_response :success
  end

  test "should get new" do
    get employee_subjects_new_url
    assert_response :success
  end

  test "should get edit" do
    get employee_subjects_edit_url
    assert_response :success
  end

  test "should get update" do
    get employee_subjects_update_url
    assert_response :success
  end

  test "should get destroy" do
    get employee_subjects_destroy_url
    assert_response :success
  end

end
