module Api::Webapp
  class UsersController < Api::ApplicationController

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: 201, location: api_user_url(user[:id]), root: false
        else
          render json: user.errors, status: :unprocessable_entity
      end
    end

    def show
      if params[:id]
        user = User.find(params[:id])
        render json: user, status: 200, root: false
      end
    end

    def index
      users = User.where(condo_id: params[:condo_id])
      render json: users, status: 200, root: false
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         render json: @user,  status: :ok
      else
         render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

      def user_params
        params.require(:user).permit(:name, :rut, :email, :password, :condo_id)
      end

    end
end
