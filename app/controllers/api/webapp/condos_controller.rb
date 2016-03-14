module Api::Webapp
  class CondosController < ApplicationController
      def index
        condos = Condo.all
        render json: condos, status: 200
      end
    end
end
