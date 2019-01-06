require 'test_helper'

class VersionCfgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @version_cfg = version_cfgs(:one)
  end

  test "should get index" do
    get version_cfgs_url, as: :json
    assert_response :success
  end

  test "should create version_cfg" do
    assert_difference('VersionCfg.count') do
      post version_cfgs_url, params: { version_cfg: { enabled: @version_cfg.enabled, files: @version_cfg.files, remarks: @version_cfg.remarks, ver: @version_cfg.ver } }, as: :json
    end

    assert_response 201
  end

  test "should show version_cfg" do
    get version_cfg_url(@version_cfg), as: :json
    assert_response :success
  end

  test "should update version_cfg" do
    patch version_cfg_url(@version_cfg), params: { version_cfg: { enabled: @version_cfg.enabled, files: @version_cfg.files, remarks: @version_cfg.remarks, ver: @version_cfg.ver } }, as: :json
    assert_response 200
  end

  test "should destroy version_cfg" do
    assert_difference('VersionCfg.count', -1) do
      delete version_cfg_url(@version_cfg), as: :json
    end

    assert_response 204
  end
end
