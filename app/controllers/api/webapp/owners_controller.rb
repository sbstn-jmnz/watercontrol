module Api::Webapp
  class OwnersController < Api::ApplicationController
     before_action :set_owner, only: [:show]
    #
    def index
      condo = Condo.find(params[:condo_id])
      render json: condo.owners, status: 200, root: false
    end

     def create
       owner = Owner.new(owner_params)
       if owner.save
          render json: owner, status: 201, location: api_condo_owner_url(owner[:id], params[:condo_id]), root: false
       else
         render json: owner.errors, status: :unprocessable_entity
       end
     end

     def show
         render json: @owner, status: 200,
         serializer: owners::ownerMeasuresSerializer,
         include: 'owners.measures'
     end

     private
    # # Use callbacks to share common setup or constraints between actions.
     def set_owner
       @owner = Owner.find(params[:id])
     end
    #
    # # Never trust paraowners from the scary internet, only allow the white list through.
     def owner_params
       params.require(:owner).permit(:rut, :name, :idCorrentista)
     end

  end
end
