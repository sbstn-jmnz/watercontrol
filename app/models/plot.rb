class Plot < ActiveRecord::Base
  belongs_to :condo
  belongs_to :owner
  has_many :meters, dependent: :destroy

  validates :number, presence: true
  validates_inclusion_of :state, :in => PLOT_STATES, :allow_nil => true
  validates_associated :condo
  validates_associated :owner


  PLOT_STATES.each do |state|
    define_method("#{state}?") do
      self.state == state
    end

    define_method("#{state}!") do
      self.update_attribute(:state, state)
    end
  end
end
