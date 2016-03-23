module Api::Webapp
  class UsersController < Api::ApplicationController

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: 201, location: api_user_url(user[:id]), root: false
      end
    end

    def show
    end

    def index
      users = User.all
      render json: users, status: 200
    end

  private

      def user_params
        params.require(:user). permit(:name, :rut)
      end

    end
end
