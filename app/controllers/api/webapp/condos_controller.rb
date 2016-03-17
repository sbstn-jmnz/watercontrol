module Api::Webapp
  class CondosController < Api::ApplicationController

      def index
          condos = Condo.all
          render json: condos, status: 200, serializer: CondoSerializer
      end

      def show
        if params[:id]
          condo = Condo.find(params[:id])
          render json: condo, status: 200, serializer: CondoSerializer
        end
      end
    end
end
