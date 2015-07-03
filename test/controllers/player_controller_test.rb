require 'test_helper'

class PlayerControllerTest < ActionController::TestCase
  test "should get show_with_items_and_spells" do
    get :show_with_items_and_spells
    assert_response :success
  end

end
