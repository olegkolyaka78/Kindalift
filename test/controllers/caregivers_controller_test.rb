require "test_helper"

class CaregiversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caregiver = caregivers(:one)
  end

  test "should get index" do
    get caregivers_url
    assert_response :success
  end

  test "should get new" do
    get new_caregiver_url
    assert_response :success
  end

  test "should create caregiver" do
    assert_difference('Caregiver.count') do
      post caregivers_url, params: { caregiver: { address: @caregiver.address, address_id: @caregiver.address_id, child_id: @caregiver.child_id, email: @caregiver.email, event_id: @caregiver.event_id, event_task_id: @caregiver.event_task_id, first_name: @caregiver.first_name, last_name: @caregiver.last_name, phone: @caregiver.phone } }
    end

    assert_redirected_to caregiver_url(Caregiver.last)
  end

  test "should show caregiver" do
    get caregiver_url(@caregiver)
    assert_response :success
  end

  test "should get edit" do
    get edit_caregiver_url(@caregiver)
    assert_response :success
  end

  test "should update caregiver" do
    patch caregiver_url(@caregiver), params: { caregiver: { address: @caregiver.address, address_id: @caregiver.address_id, child_id: @caregiver.child_id, email: @caregiver.email, event_id: @caregiver.event_id, event_task_id: @caregiver.event_task_id, first_name: @caregiver.first_name, last_name: @caregiver.last_name, phone: @caregiver.phone } }
    assert_redirected_to caregiver_url(@caregiver)
  end

  test "should destroy caregiver" do
    assert_difference('Caregiver.count', -1) do
      delete caregiver_url(@caregiver)
    end

    assert_redirected_to caregivers_url
  end
end
