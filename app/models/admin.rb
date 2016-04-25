class Admin < ActiveRecord::Base
  ROLE = %w{ admin superadmin }

  has_and_belongs_to_many :condos

  validates :name, :email, :password, :rut, presence: true
  before_save :md5_password
  before_create :set_auth_token

  def authenticate(password)
    if self.password == password
       true
     else
       false
     end
  end

  private

  def md5_password
    self.password = Digest::MD5.hexdigest self.password
  end

  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
  end
end
