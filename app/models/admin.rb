class Admin < ActiveRecord::Base
  ROLE = %w{ admin superadmin }

  has_many :condos
end
