class Meter < ActiveRecord::Base
  STATUS = %w{ active inactive }
  
  belongs_to :plot
  has_many :measures

  validates_associated :plot
  validates :number, presence: true
  validates :status, presence: true
  validates_inclusion_of :status, :in => STATUS, :allow_nil => true


  def last_measure
    measures.joins(:user).select("measures.value,
                                  measures.status,
                                  measures.comment,
                                  measures.id,
                                  measures.created_at,
                                  users.name as last_measurer").last
  end



  Meter::STATUS.each do |status|
    define_method("#{status}?") do
      self.status == status
    end

    define_method("#{status}!") do
      self.update_attribute(:status, status)
    end
  end

end