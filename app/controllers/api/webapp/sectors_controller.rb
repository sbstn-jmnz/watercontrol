module Api::Webapp
  class SectorsController < Api::ApplicationController
    before_action :sectors

    def index
      sectors
      render json: @sectors, status: 200, root: false
    end


    def update
      ActiveRecord::Base.transaction do
        params[:sectors].each do |s|
          sector = Sector.find(s[:id])
          sector.update!(sector_params(s))
        end
        render json: @sectors.reload, status: 200, root: false
      end
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => exception
         render nothing: true, status: 422
    end

    private

   def sectors
     @sectors = Sector.where(condo_id: params[:condo_id]).order(:id)
   end

   def sector_params(sector)
      sector.permit(:id, :user_id)
    end
  end
end
