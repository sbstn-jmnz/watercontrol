module Api::Mobileapp
  class SectorsController < Api::ApplicationController

    def index
      user = User.find(params[:user_id])
      sectors = Sector.where(user_id: user.id).to_a
      if MeasureProcess.where(status: 'active').count == 1
        render json: user, status:200, serializer: Users::UserSerializer,
        include: 'sectors.plots.meters.measures', root: false
     else
        user = { message: 'No Measure Proccess found' }
        render json: user, status: 422
      end
    end

  end
end
