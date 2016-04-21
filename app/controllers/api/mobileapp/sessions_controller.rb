module Api::Mobileapp
  class SessionsController < ActionController::API
    before_action :authenticate

    def create
      user = User.find_by(email: session_params[:email])
      if user && user.authenticate(hash_password)
        render json: user, status: 201, root: false
      else
        user = { message: 'Invalid credentials' }
        render json: user, status: 401
      end
    end

    protected

    def authenticate
      session_params[:auth_token] ? authenticate_token : create
    end

    def authenticate_token
      user = User.find_by(auth_token: session_params[:auth_token])
      render json: user, status: 200
    end

  def session_params
    params.permit(:email, :password, :auth_token)
  end

  def hash_password
    Digest::MD5.hexdigest(session_params[:password])
  end

 end
end
