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
      
      Measure.transaction do
        
        params[:measures].each do |m|
          measure = Measure.create(measure_params(m));
        end

        # Falta mejorar esta parte para soportar transacciones 
      end

      render json: measure, status: 201, location: api_measure_url(measure[:id]), root: false

      # params[:measures].each do |measure|
      #   Measure.create(measure_params(measure))
      # end
      # measure_params
      # Measure.new(measure_params)
      # if measure.save
      #   render json: measure, status: 201, location: api_measure_url(measure[:id]), root: false
      # end
    end

    private
      
      def measure_params(measure)
        measure.permit(:value, :comment, :meter_id, :user_id);
        # params.permit( measures: [:value, :comment, :meter_id, :user_id])[:measures]
      end

  end
end