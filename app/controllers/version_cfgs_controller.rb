class VersionCfgsController < ApplicationController
  before_action :set_version_cfg, only: [:show, :update, :destroy]

  # GET /version_cfgs
  def index
    @version_cfgs = VersionCfg.all

    render json: @version_cfgs
  end

  # GET /version_cfgs/1
  def show
    render json: @version_cfg
  end

  # POST /version_cfgs
  def create
    @version_cfg = VersionCfg.new(version_cfg_params)

    if @version_cfg.save
      render json: @version_cfg, status: :created, location: @version_cfg
    else
      render json: @version_cfg.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /version_cfgs/1
  def update
    if @version_cfg.update(version_cfg_params)
      render json: @version_cfg
    else
      render json: @version_cfg.errors, status: :unprocessable_entity
    end
  end

  # DELETE /version_cfgs/1
  def destroy
    @version_cfg.destroy
  end
  def get_ver
    @ver=VersionCfg.where(:platform=>params[:platform],:enabled=>true).last
    old_ver=params[:ver]
    if old_ver!=@ver.ver.to_s#ver是整数
      #查找对应平台下最新使能版本并返回
      render json:@ver
    else
      render json:nil
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version_cfg
      @version_cfg = VersionCfg.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def version_cfg_params
      params.require(:version_cfg).permit(:ver, :files, :remarks, :enabled)
    end
end
