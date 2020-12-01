require "application_system_test_case"

class FarmsTest < ApplicationSystemTestCase
  setup do
    @farm = farms(:one)
  end

  test "visiting the index" do
    visit farms_url
    assert_selector "h1", text: "Farms"
  end

  test "creating a Farm" do
    visit farms_url
    click_on "New Farm"

    fill_in "Address", with: @farm.address
    fill_in "Description", with: @farm.description
    fill_in "Name", with: @farm.name
    click_on "Create Farm"

    assert_text "Farm was successfully created"
    click_on "Back"
  end

  test "updating a Farm" do
    visit farms_url
    click_on "Edit", match: :first

    fill_in "Address", with: @farm.address
    fill_in "Description", with: @farm.description
    fill_in "Name", with: @farm.name
    click_on "Update Farm"

    assert_text "Farm was successfully updated"
    click_on "Back"
  end

  test "destroying a Farm" do
    visit farms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Farm was successfully destroyed"
  end
end
