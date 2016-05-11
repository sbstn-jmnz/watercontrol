module Api::Webapp
  class MetersController < Api::ApplicationController
before_action :set_meter, only: [:show]

  def create
    meter = Meter.new(meter_params)
    if meter.save
      render json: meter, status: 201, location: api_meter_url(meter[:id]), root: false
    else
      render json: meter.errors, status: :unprocessable_entity
    end
  end

    def show
        render json: meter, status: 200,
        serializer: Meters::MeterMeasuresSerializer,
        include: 'meters.measures'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_meter
      @meter = meter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meter_params
      params.require(:meter).permit(:number, :status, :plot_id)
    end

  end
end
