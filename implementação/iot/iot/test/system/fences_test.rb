require "application_system_test_case"

class FencesTest < ApplicationSystemTestCase
  setup do
    @fence = fences(:one)
  end

  test "visiting the index" do
    visit fences_url
    assert_selector "h1", text: "Fences"
  end

  test "creating a Fence" do
    visit fences_url
    click_on "New Fence"

    fill_in "Name", with: @fence.name
    fill_in "Position", with: @fence.position
    check "Status" if @fence.status
    click_on "Create Fence"

    assert_text "Fence was successfully created"
    click_on "Back"
  end

  test "updating a Fence" do
    visit fences_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fence.name
    fill_in "Position", with: @fence.position
    check "Status" if @fence.status
    click_on "Update Fence"

    assert_text "Fence was successfully updated"
    click_on "Back"
  end

  test "destroying a Fence" do
    visit fences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fence was successfully destroyed"
  end
end
