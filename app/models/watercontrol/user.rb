class User < ActiveRecord::Base

  has_many :measures
  has_many :sectors
  belongs_to :condo

  validates :auth_token, uniqueness: true
  validates :name, :email, :password, :rut, presence: true
  before_create :set_auth_token
  before_save :md5_password

  def authenticate(password)
     if self.password == password
       true
     else
       false
     end
  end
  
  protected

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
