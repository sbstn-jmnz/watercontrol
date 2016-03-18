module Api::Webapp
  class PlotsController < Api::ApplicationController
      def index
        @plots = Plot.all
        render json: @plots, status: 200
      end
    end
end
