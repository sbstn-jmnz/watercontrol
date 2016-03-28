module Api::Webapp
  class SectorsController < Api::ApplicationController
      def index
        sectors = Sector.all
        render json: sectors, status: 200, root: false
      end

      def show
      end
    end
end
