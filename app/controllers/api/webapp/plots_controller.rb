module Api::Webapp
  class PlotsController < Api::ApplicationController
      def index
        plots = Plot.all
        render json: plots, status: 200, root: false
      end
    end
end
