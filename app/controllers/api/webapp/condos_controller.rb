module Api::Webapp
  class CondosController < Api::ApplicationController

      def index
          condos = Condo.all
          render json: condos, status: 200
      end

      def show
        if params[:id]
          condo = Condo.find(params[:id]).with_plots
          render json: condo, status: 200
        end
      end
    end
end
