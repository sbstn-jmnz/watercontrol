module Api::Webapp
  class PlotsController < Api::ApplicationController
     before_action :set_plot, only: [:show, :update]
      def index
        condo = Condo.find(params[:condo_id])
        plots = condo.plots
        render json: plots, status: 201, serializer: ActiveModel::Serializer::CollectionSerializer,
        each_serializer: Plots::PlotSerializer
      end

      def show
        render json: @plot, status: 200, root: false, serializer: Plots::PlotSerializer
      end

      def update
        if @plot.update(plot_params)
          render json: @plot, status: :ok
        else
          render json: @plot.errors, status: :unprocessable_entity
        end
      end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_plot
      @plot = Plot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plot_params
      params.require(:plot).permit(:plot_number, :status, :sector_id, :owner_id)
    end

  end
end
