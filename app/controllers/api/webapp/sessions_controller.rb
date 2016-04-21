module Api::Webapp
  class SessionsController < ActionController::API
    before_action :authenticate

    def create
  		admin = Admin.find_by(email: admin_params[:email])
  		if admin && admin.authenticate(hash_password)
        render json: admin, serializer: Api::Webapp::Admins::AdminSerializer, status: 201, root: false
      else
        admin = { message: 'Invalid credentials' }
        render json: admin, status: 401
  		end
  	end

  protected

  def authenticate
    admin_params[:auth_token] ? authenticate_token : create
  end

  def authenticate_token
    admin = Admin.find_by(auth_token: admin_params[:auth_token])
    render json: admin, status: 200
  end

  def admin_params
  	params.permit(:email, :password, :auth_token)
  end

  def hash_password
    Digest::MD5.hexdigest(admin_params[:password])
  end

 end
end
