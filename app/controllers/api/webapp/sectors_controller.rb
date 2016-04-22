module Api::Webapp
  class SectorsController < Api::ApplicationController
    before_action :set_sector

    def update
      if @sector.update(sector_params)
        debugger
        render json: @sector, status: :ok
      else
        render json: @sector.errors, status: :unprocessable_entity
      end
    end

    private

    def set_sector
      @sector = Sector.find(params[:id])
    end

    def sector_params(sector)
      params.permit(:id, :user_id)
    end
  end
end
