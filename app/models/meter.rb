class Meter < ActiveRecord::Base
  belongs_to :plot
  has_many :measures
  validates_associated :plot
  validates :number, presence: true
  validates :state, presence: true
  validates_inclusion_of :state, :in => STATES, :allow_nil => true

  STATES = %w{ active inactive }

  STATES.each do |state|
    define_method("#{state}?") do
      self.state == state
    end

    define_method("#{state}!") do
      self.update_attribute(:state, state)
    end
  end

end
