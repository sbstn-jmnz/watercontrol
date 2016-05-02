module Api::Webapp
  class PlotsController < Api::ApplicationController
      def index
        condo = Condo.find(params[:condo_id])
        plots = condo.plots
        render json: plots, status: 200, serializer: ActiveModel::Serializer::ArraySerializer,
        each_serializer: Plots::PlotSerializer
      end

      def show
        if params[:id]
          plot = Plot.find(params[:id])
          render json: plot, status: 200, root: false
        end
      end

      def update

      end

  end
end
