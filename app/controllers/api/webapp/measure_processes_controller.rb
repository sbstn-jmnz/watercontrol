module Api::Webapp
  class MeasureProcessesController < Api::ApplicationController

    def index
      measuresProcesses = MeasureProcess.all
      render json: measuresProcesses, status: 200
    end

    def show
     
    end

  end
end
