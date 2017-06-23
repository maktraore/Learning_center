require 'test_helper'

class CampusSubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get campus_subjects_index_url
    assert_response :success
  end

  test "should get show" do
    get campus_subjects_show_url
    assert_response :success
  end

  test "should get new" do
    get campus_subjects_new_url
    assert_response :success
  end

  test "should get edit" do
    get campus_subjects_edit_url
    assert_response :success
  end

  test "should get update" do
    get campus_subjects_update_url
    assert_response :success
  end

  test "should get destroy" do
    get campus_subjects_destroy_url
    assert_response :success
  end

end
