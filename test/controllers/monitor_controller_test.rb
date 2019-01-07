require 'test_helper'

class MonitorControllerTest < ActionDispatch::IntegrationTest
  test "should get set_miner_cmd" do
    get monitor_set_miner_cmd_url
    assert_response :success
  end

end
