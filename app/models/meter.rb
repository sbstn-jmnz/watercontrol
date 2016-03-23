class Meter < ActiveRecord::Base
  belongs_to :plot
  has_many :measures

  validates_associated :plot
  validates :number, presence: true
  validates :state, presence: true
  validates_inclusion_of :state, :in => METER_STATES, :allow_nil => true


  def last_measure
    measures.select(:value, :comment, :created_at, :id).last
  end

  def last_measurer
    User.find(last_measurer_id).name
  end

  def last_measurer_id
    measures.last.user_id
  end


  METER_STATES.each do |state|
    define_method("#{state}?") do
      self.state == state
    end

    define_method("#{state}!") do
      self.update_attribute(:state, state)
    end
  end

end
