require "test_helper"

class StatusChangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_change = status_changes(:one)
  end

  test "should get index" do
    get status_changes_url
    assert_response :success
  end

  test "should get new" do
    get new_status_change_url
    assert_response :success
  end

  test "should create status_change" do
    assert_difference("StatusChange.count") do
      post status_changes_url, params: { status_change: { project_id: @status_change.project_id, status: @status_change.status, user_id: @status_change.user_id } }
    end

    assert_redirected_to status_change_url(StatusChange.last)
  end

  test "should show status_change" do
    get status_change_url(@status_change)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_change_url(@status_change)
    assert_response :success
  end

  test "should update status_change" do
    patch status_change_url(@status_change), params: { status_change: { project_id: @status_change.project_id, status: @status_change.status, user_id: @status_change.user_id } }
    assert_redirected_to status_change_url(@status_change)
  end

  test "should destroy status_change" do
    assert_difference("StatusChange.count", -1) do
      delete status_change_url(@status_change)
    end

    assert_redirected_to status_changes_url
  end
end
