require 'test_helper'

class ArrondissementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arrondissements_index_url
    assert_response :success
  end

  test "should get show" do
    get arrondissements_show_url
    assert_response :success
  end

end
