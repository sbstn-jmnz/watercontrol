module Api::Webapp
  class SessionsController < ActionController::API

    def create
  		admin = Admin.find_by(email: admin_params[:email])
  		if admin && admin.authenticate(hash_password)
        render json: admin, status: 201, root: false
      else
        admin = { message: 'Invalid credentials' }
        render json: admin, status: 401
  		end
  	end

  private

  def admin_params
  	params.permit(:email, :password)
  end

  def hash_password
    Digest::MD5.hexdigest(admin_params[:password])
  end

 end
end
