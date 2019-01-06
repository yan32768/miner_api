require 'test_helper'

class MinerCmdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @miner_cmd = miner_cmds(:one)
  end

  test "should get index" do
    get miner_cmds_url, as: :json
    assert_response :success
  end

  test "should create miner_cmd" do
    assert_difference('MinerCmd.count') do
      post miner_cmds_url, params: { miner_cmd: { cardType: @miner_cmd.cardType, cmd: @miner_cmd.cmd, pkgName: @miner_cmd.pkgName, ver: @miner_cmd.ver } }, as: :json
    end

    assert_response 201
  end

  test "should show miner_cmd" do
    get miner_cmd_url(@miner_cmd), as: :json
    assert_response :success
  end

  test "should update miner_cmd" do
    patch miner_cmd_url(@miner_cmd), params: { miner_cmd: { cardType: @miner_cmd.cardType, cmd: @miner_cmd.cmd, pkgName: @miner_cmd.pkgName, ver: @miner_cmd.ver } }, as: :json
    assert_response 200
  end

  test "should destroy miner_cmd" do
    assert_difference('MinerCmd.count', -1) do
      delete miner_cmd_url(@miner_cmd), as: :json
    end

    assert_response 204
  end
end
