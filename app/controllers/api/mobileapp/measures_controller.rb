module Api::Mobileapp
  class MeasuresController < Api::ApplicationController

    def index
      puts params.to_s
      measures = Measure.all
      render json: measures, status: 200, root: false
    end

     def show
     end

     
    def create
      ActiveRecord::Base.transaction do
          params[:measures].each do |m|
          measure = Measure.create!(measure_params(m));
        end
      end
        render nothing: true, status: 204
      rescue ActiveRecord::RecordInvalid => exception
        render nothing: true, status: 422
    end

    private

      def measure_params(measure)
        measure.permit(:value, :comment, :meter_id, :user_id);
      end

  end
end
