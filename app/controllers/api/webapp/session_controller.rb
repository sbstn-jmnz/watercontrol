module Api::Webapp
  class SessionController < Api::ApplicationController
  	def create
  		admin = Admin.find_by(email: admin_params[:email])
  		if admin && admin.authenticate(admin_params[:password])
  			self.current_user = admin
  			render json: admin, status: 200, serializer: Admins::AdminSerializer, root: false
  		else
  			return api_error(status: 401)
  		end
  	end

  private

  def method_name
  	params.require(:admin).permit(:email, :password)
  end
end