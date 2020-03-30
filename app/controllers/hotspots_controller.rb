class HotspotsController < ApplicationController
  before_action :set_hotspot, only: [:show, :update, :destroy]

  # GET /hotspots
  def index
    @hotspots = Hotspot.all

    render json: @hotspots
  end

  # GET /hotspots/1
  def show
    render json: @hotspot
  end

  # POST /hotspots
  def create
    @hotspot = Hotspot.new(hotspot_params)

    if @hotspot.save
      render json: @hotspot, status: :created, location: @hotspot
    else
      render json: @hotspot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotspots/1
  def update
    if @hotspot.update(hotspot_params)
      render json: @hotspot
    else
      render json: @hotspot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotspots/1
  def destroy
    @hotspot.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotspot
      @hotspot = Hotspot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotspot_params
      params.require(:hotspot).permit(:name, :latitude, :longitude)
    end
end
