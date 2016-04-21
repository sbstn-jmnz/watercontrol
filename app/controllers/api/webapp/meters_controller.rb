module Api::Webapp
  class MetersController < Api::ApplicationController

    def index

    end

    def show
      if params[:id]
        meter = Meter.find(params[:id])
        render json: meter, status: 200,
        serializer: Meters::MeterMeasuresSerializer,
        include: 'meters.measures'
      end
    end

  end
end
