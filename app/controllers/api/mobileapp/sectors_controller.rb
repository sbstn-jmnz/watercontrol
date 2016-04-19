module Api::Mobileapp
  class SectorsController < Api::ApplicationController

    def index
      user = User.find(params[:user_id])
      
      if MeasureProcess.where(status: 'active').count == 1
        render json: user, status:200, serializer: Users::UserSerializer,
        include: 'sectors.plots.meters.last_measure'
      else
        user = { message: 'No Measure Proccess found' }
        render json: user, status: 422
      end
    end

  end
end
