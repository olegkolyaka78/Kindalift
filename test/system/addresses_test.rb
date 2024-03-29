require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: "Addresses"
  end

  test "creating a Address" do
    visit addresses_url
    click_on "New Address"

    fill_in "Caregiver", with: @address.caregiver_id
    fill_in "Child", with: @address.child_id
    fill_in "Event", with: @address.event_id
    fill_in "Event task", with: @address.event_task_id
    fill_in "Name", with: @address.name
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "updating a Address" do
    visit addresses_url
    click_on "Edit", match: :first

    fill_in "Caregiver", with: @address.caregiver_id
    fill_in "Child", with: @address.child_id
    fill_in "Event", with: @address.event_id
    fill_in "Event task", with: @address.event_task_id
    fill_in "Name", with: @address.name
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "destroying a Address" do
    visit addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address was successfully destroyed"
  end
end
