require 'test_helper'

class FencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fence = fences(:one)
  end

  test "should get index" do
    get fences_url
    assert_response :success
  end

  test "should get new" do
    get new_fence_url
    assert_response :success
  end

  test "should create fence" do
    assert_difference('Fence.count') do
      post fences_url, params: { fence: { name: @fence.name, position: @fence.position, status: @fence.status } }
    end

    assert_redirected_to fence_url(Fence.last)
  end

  test "should show fence" do
    get fence_url(@fence)
    assert_response :success
  end

  test "should get edit" do
    get edit_fence_url(@fence)
    assert_response :success
  end

  test "should update fence" do
    patch fence_url(@fence), params: { fence: { name: @fence.name, position: @fence.position, status: @fence.status } }
    assert_redirected_to fence_url(@fence)
  end

  test "should destroy fence" do
    assert_difference('Fence.count', -1) do
      delete fence_url(@fence)
    end

    assert_redirected_to fences_url
  end
end
