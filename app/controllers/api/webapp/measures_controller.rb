module Api::Webapp
  class MeasuresController < Api::ApplicationController
      # def index
      #   sectors = Sector.all
      #   render json: sectors, status: 200, root: false
      # end

      # def show
      # end

      def create
        measure = Measure.new(measure_params)
        puts measure.valid?
        measure.errors.messages.each do |error|
          puts error.inspect
        end

        if measure.save
          render json: measure, status: 201, location: api_measure_url(measure[:id]), root: false
        end
      end

      private
        
        def measure_params
          puts params;
          params.permit(:value, :comment, :status)
        end
    end
end