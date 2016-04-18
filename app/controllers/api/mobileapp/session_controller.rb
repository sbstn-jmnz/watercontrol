module Api::Mobileapp
  class SessionController < Api::ApplicationController
  	def create
  		user = User.find_by(email: admin_params[:email])
  		if admin && admin.authenticate(admin_params[:password])
  			self.current_user = user
  			render json: user, status: 200, serializer: Users::AdminSerializer, root: false
  		else
  			return api_error(status: 401)
  		end
  	end

  private

  def method_name
  	params.require(:user).permit(:email, :password)
  end
end