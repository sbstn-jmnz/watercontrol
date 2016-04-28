class Plot < ActiveRecord::Base
  STATUS = %w{ sold available }

  belongs_to :sector
  belongs_to :owner
  has_many :meters, dependent: :destroy

  validates :plot_number, presence: true
  validates_inclusion_of :status, :in => STATUS, :allow_nil => true
  validates_associated :sector
  validates_associated :owner



  STATUS.each do |status|
    define_method("#{status}?") do
      self.status == status
    end

    define_method("#{status}!") do
      self.update_attribute(:status, status)
    end
  end
end