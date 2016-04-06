module Api::Mobileapp
  class MeasuresController < Api::ApplicationController
      
    def index
      puts params.to_s
      measures = Measure.all
      render json: measures, status: 200, root: false
    end

    # def show
    # end

    def create
      measure = Measure.new(measure_params)
      if measure.save
        render json: measure, status: 201, location: api_measure_url(measure[:id]), root: false
      end
    end

    private
      
      def measure_params
        params.permit(:value, :comment, :status, :meter_id)
      end

  end
end