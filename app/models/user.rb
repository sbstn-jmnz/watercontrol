class User < ActiveRecord::Base
  has_one :role
  has_many :measures
end
