module Api::Webapp
  class ChargeParametersController < Api::ApplicationController

      def update
        #debugger
        charge_params = ChargeParameter.where(condo_id: params[:condo_id]).first
        charge_params.fixed = params[:fixed]
        charge_params.normal_price = params[:normal_price]
        charge_params.over_consumption_price = params[:over_consumption_price]
        if charge_params.save
          render json: charge_params, status: 200
        end
      end

      def index
        charge_params = ChargeParameter.where(condo_id: params[:condo_id]).first
        render json: charge_params, status: 200
      end
private

    def charge_params
      params.permit(:fixed, :normal_price, :over_consumption_price, :condo_id)
    end

    end
end
