module Api::Mobileapp
  class MeasuresController < Api::ApplicationController

    def index
      puts params.to_s
      measures = Measure.all
      render json: measures, status: 200, root: false
    end

     def update
       ActiveRecord::Base.transaction do
         params[:measures].each do |m|
          measure = Measure.find(m[:id])
         if measure_params(m).has_key?(:value)
            measure.update!(measure_params(m));
            measure.status = Measure::STATUS.third
            measure.save!
          end
         end
       end
         render nothing: true, status: 204
       rescue ActiveRecord::RecordInvalid => exception
         render nothing: true, status: 422
     end

    private

      def measure_params(measure)
        measure.permit(:value, :comment, :id, :user_id);
      end

  end
end
