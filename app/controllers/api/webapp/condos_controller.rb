module Api::Webapp
  class CondosController < Api::ApplicationController

      def index
          condos = Condo.all
          render json: condos, status: 200
      end

      def show
        if params[:id]
          @condo = Condo.find(params[:id])
          render json: @condo, status: 200, serializer: Condos::CondoSerializer, root: false
        end
      end
    end
end
