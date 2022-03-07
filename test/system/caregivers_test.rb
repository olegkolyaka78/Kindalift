require "application_system_test_case"

class CaregiversTest < ApplicationSystemTestCase
  setup do
    @caregiver = caregivers(:one)
  end

  test "visiting the index" do
    visit caregivers_url
    assert_selector "h1", text: "Caregivers"
  end

  test "creating a Caregiver" do
    visit caregivers_url
    click_on "New Caregiver"

    fill_in "Address", with: @caregiver.address
    fill_in "Address", with: @caregiver.address_id
    fill_in "Child", with: @caregiver.child_id
    fill_in "Email", with: @caregiver.email
    fill_in "Event", with: @caregiver.event_id
    fill_in "Event task", with: @caregiver.event_task_id
    fill_in "First name", with: @caregiver.first_name
    fill_in "Last name", with: @caregiver.last_name
    fill_in "Phone", with: @caregiver.phone
    click_on "Create Caregiver"

    assert_text "Caregiver was successfully created"
    click_on "Back"
  end

  test "updating a Caregiver" do
    visit caregivers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @caregiver.address
    fill_in "Address", with: @caregiver.address_id
    fill_in "Child", with: @caregiver.child_id
    fill_in "Email", with: @caregiver.email
    fill_in "Event", with: @caregiver.event_id
    fill_in "Event task", with: @caregiver.event_task_id
    fill_in "First name", with: @caregiver.first_name
    fill_in "Last name", with: @caregiver.last_name
    fill_in "Phone", with: @caregiver.phone
    click_on "Update Caregiver"

    assert_text "Caregiver was successfully updated"
    click_on "Back"
  end

  test "destroying a Caregiver" do
    visit caregivers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Caregiver was successfully destroyed"
  end
end
