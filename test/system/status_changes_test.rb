require "application_system_test_case"

class StatusChangesTest < ApplicationSystemTestCase
  setup do
    @status_change = status_changes(:one)
  end

  test "visiting the index" do
    visit status_changes_url
    assert_selector "h1", text: "Status changes"
  end

  test "should create status change" do
    visit status_changes_url
    click_on "New status change"

    fill_in "Project", with: @status_change.project_id
    fill_in "Status", with: @status_change.status
    fill_in "User", with: @status_change.user_id
    click_on "Create Status change"

    assert_text "Status change was successfully created"
    click_on "Back"
  end

  test "should update Status change" do
    visit status_change_url(@status_change)
    click_on "Edit this status change", match: :first

    fill_in "Project", with: @status_change.project_id
    fill_in "Status", with: @status_change.status
    fill_in "User", with: @status_change.user_id
    click_on "Update Status change"

    assert_text "Status change was successfully updated"
    click_on "Back"
  end

  test "should destroy Status change" do
    visit status_change_url(@status_change)
    click_on "Destroy this status change", match: :first

    assert_text "Status change was successfully destroyed"
  end
end
