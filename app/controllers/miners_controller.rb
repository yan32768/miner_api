class MinersController < ApplicationController
  before_action :set_miner, only: [:show, :update, :destroy]

  # GET /miners
  def index
    @miners = Miner.all

    render json: @miners
  end

  # GET /miners/1
  def show
    render json: @miner
  end

  # POST /miners
  def create
    @miner = Miner.new(miner_params)

    if @miner.save
      render json: @miner, status: :created, location: @miner
    else
      render json: @miner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /miners/1
  def update
    if @miner.update(miner_params)
      render json: @miner
    else
      render json: @miner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /miners/1
  def destroy
    @miner.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miner
      @miner = Miner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def miner_params
      params.require(:miner).permit(:rigName, :minerPath, :cardType, :serverIp, :piIp, :localOpts, :sts, :enabled)
    end
end
