module Api::Mobileapp
  class SessionsController < ActionController::API
  	def create
    	user = User.find_by(email: session_params[:email])
    	if user && user.authenticate(hash_password)
  			render json: user, status: 201, root: false
  		else
        user = { message: 'Invalid credentials' }
  			render json: user, status: 401
  		end
  	end

  private

  def session_params
    params.permit(:email, :password)
  end

  def hash_password
    Digest::MD5.hexdigest(session_params[:password])
  end

 end
end
