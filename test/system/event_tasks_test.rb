require "application_system_test_case"

class EventTasksTest < ApplicationSystemTestCase
  setup do
    @event_task = event_tasks(:one)
  end

  test "visiting the index" do
    visit event_tasks_url
    assert_selector "h1", text: "Event Tasks"
  end

  test "creating a Event task" do
    visit event_tasks_url
    click_on "New Event Task"

    fill_in "Address", with: @event_task.address
    fill_in "Address", with: @event_task.address_id
    fill_in "Caregiver", with: @event_task.caregiver_id
    fill_in "Child", with: @event_task.child_id
    fill_in "Datetime", with: @event_task.datetime
    fill_in "Event", with: @event_task.event_id
    fill_in "Name", with: @event_task.name
    fill_in "Priority", with: @event_task.priority
    fill_in "Status", with: @event_task.status
    click_on "Create Event task"

    assert_text "Event task was successfully created"
    click_on "Back"
  end

  test "updating a Event task" do
    visit event_tasks_url
    click_on "Edit", match: :first

    fill_in "Address", with: @event_task.address
    fill_in "Address", with: @event_task.address_id
    fill_in "Caregiver", with: @event_task.caregiver_id
    fill_in "Child", with: @event_task.child_id
    fill_in "Datetime", with: @event_task.datetime
    fill_in "Event", with: @event_task.event_id
    fill_in "Name", with: @event_task.name
    fill_in "Priority", with: @event_task.priority
    fill_in "Status", with: @event_task.status
    click_on "Update Event task"

    assert_text "Event task was successfully updated"
    click_on "Back"
  end

  test "destroying a Event task" do
    visit event_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event task was successfully destroyed"
  end
end
