module Api::Webapp
  class MeasureProcessesController < Api::ApplicationController

    def index
      measuresProcesses = MeasureProcess.all
      render json: measuresProcesses, status: 200
    end

    def close
      process = MeasureProcess.find(params[:id])
      
      if process
        
        process.status = MeasureProcess::STATUS.second
        process.closed_at = Time.now
        process.save
        
        #Una vez cerrado 
        Invoice.create_invoices(params[:id], params[:condo_id])
      
      end
      render json: {message: 'ok'}, status: 204
    end

    def create
      if MeasureProcess.where(status: 'active').count == 0
           condo = Condo.find(params[:condo_id])
           ActiveRecord::Base.transaction do
            process = MeasureProcess.create!({
            fixed: ChargeParameter.take.fixed,
            normal_price: ChargeParameter.take.normal_price,
            over_consumption_price: ChargeParameter.take.over_consumption_price,
            status: MeasureProcess::STATUS.first
            })
            condo.meters.each do |meter|
              measure = Measure.new({
              value: 0,
              status: 'pending',
              user_id: User.where(role: 'user').take.id,
              measure_process_id: process.id,
              meter_id: meter.id}
              )
              measure.save(validate: false)
            end

            render json: {process_id: process.id}, status: 201, root: false
          end
        else
          render nothing: true, status: 422
      end
    end

  private

  def process_params
    params.permit(:condo_id)
  end

  end
end
