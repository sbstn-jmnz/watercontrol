class Admin < ActiveRecord::Base
  ROLE = %w{ admin superadmin }

  has_and_belongs_to_many :condos
end
