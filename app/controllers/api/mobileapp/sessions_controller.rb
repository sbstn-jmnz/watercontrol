module Api::Mobileapp
  class SessionsController < ActionController::API
  	def create
      debugger
  		user = User.find_by(email: session_params[:email])
      
    	if admin && admin.authenticate(admin_params[:password])
  			self.current_user = user
  			render json: user, status: 200, serializer: Users::AdminSerializer, root: false
  		else
  			render api_error(status: 401)
  		end
  	end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
 
 end
end