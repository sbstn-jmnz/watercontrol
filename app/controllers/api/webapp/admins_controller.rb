module Api::Webapp
  class AdminsController < Api::ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

      def update
        if @admin.update(admin_params)
          render json: @admin, status: :ok
        else
          render json: @admin.errors, status: :unprocessable_entity
        end
      end

 private

      def set_user
          @admin = Admin.find(params[:id])
      end

      def admin_params
           params.require(:admin).permit(:name, :rut, :email, :password)
      end

   end

end
