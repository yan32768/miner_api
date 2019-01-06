class MinerCmdsController < ApplicationController
  before_action :set_miner_cmd, only: [:show, :update, :destroy]

  # GET /miner_cmds
  def index
    @miner_cmds = MinerCmd.all

    render json: @miner_cmds
  end

  # GET /miner_cmds/1
  def show
    render json: @miner_cmd
  end

  # POST /miner_cmds
  def create
    @miner_cmd = MinerCmd.new(miner_cmd_params)

    if @miner_cmd.save
      render json: @miner_cmd, status: :created, location: @miner_cmd
    else
      render json: @miner_cmd.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /miner_cmds/1
  def update
    if @miner_cmd.update(miner_cmd_params)
      render json: @miner_cmd
    else
      render json: @miner_cmd.errors, status: :unprocessable_entity
    end
  end

  # DELETE /miner_cmds/1
  def destroy
    @miner_cmd.destroy
  end
  def get_cmd
    @miner_cmd=MinerCmd.where(:cardType=>params['cardType'],:enabled=>true).last
    render json: @miner_cmd
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miner_cmd
      @miner_cmd = MinerCmd.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def miner_cmd_params
      params.require(:miner_cmd).permit(:cardType, :cmd, :pkgName, :ver)
    end
end
