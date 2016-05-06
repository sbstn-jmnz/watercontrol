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

  def current_measure_value
    last_twelve_measures.last.value
  end

  def last_measure_value
    last_twelve_measures[-2].value
  end

  def last_measure_process_id
    last_twelve_measures[-2].measure_process_id
  end

  def normal_limit
    300
  end

  def plot_number
    plot.plot_number
  end

  def idCorrentista
    plot.owner.account_holder.idCorrentista
  end

  def last_twelve_measures
    measures.last(12)
  end

  def graph_data_array
    # Returns a data array with lasts consumptions of the meter
    data_array = []
    last_twelve_measures.each_with_index do |measure, index|
      break if i == (measures_for_year.count - 1)
      consumption = measures_for_year[i+1].value - measure.value
      graph_data = {
        consumption: consumption < 0 ? 0 : consumption,
        created_at: measures_for_year[i+1].updated_at,
        month_label: measures_for_year[i+1].updated_at.strftime("%b")
      }
      data_array.push(graph_data)
    end
    ensure_twelve_elements(data_array)
  end

  def ensure_twelve_elements(array)
    if array.length < 12
      pivot_date = array[0][:created_at]
      (1..(12 - array.length)).each do |n|
        array.unshift({
          consumption: 0,
          created_at: pivot_date - (n).month,
          month_label: (pivot_date - (n).month).strftime("%b")
          })
      end
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
