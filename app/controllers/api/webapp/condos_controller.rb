module Api::Webapp
  class CondosController < Api::ApplicationController
      def index
        condos = Condo.all
        render json: condos, status: 200
      end
    end
end
