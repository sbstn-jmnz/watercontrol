class AdminsCondo < ActiveRecord::Base
  belongs_to :admin
  belongs_to :condo
end
