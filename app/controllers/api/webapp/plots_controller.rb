module Api::Webapp
  class PlotsController < Api::ApplicationController
      def index
        plots = Plot.all
        render json: plots, status: 200, root: false
      end

      def show
        if params[:id]
          plot = Plot.find(params[:id])
          render json: plot, status: 200, serializer: Plots::PlotSerializer, root: false
        end
      end

  end
end
