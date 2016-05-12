require 'test_helper'

class MeasureTest < ActiveSupport::TestCase

  setup do
    @meter =  create(:meter, number: 15, status: Meter::STATUS.first)
    @process = create(:measure_process)
    @measure = create(:measure_from_admin, meter_id: @meter_id, value: 500, status: Measure::STATUS.third)
    @user = create(:user, name:'Test Name', email: 'test@mail.com',password: 'secretpass', rut: '11.111.111-1')
  end

  test 'should not save measure without value' do
     measure = create :measure
     assert_not measure.valid?
     assert_equal [:value], measure.errors.keys
  end

  test 'asscociations on meter and user' do
    2.times { create(:measure_from_admin, value: 550, user_id: @user.id, meter_id: @meter.id) }
    assert_equal(2, @meter.measures.count, "Unexpected meter record count")
    assert_equal(2, @user.measures.count, "Unexpected user record count")
  end

  test 'it knows how to close a process' do
    10.times { create(:measure_from_admin, value: 555, user_id: @user.id, status: Measure::STATUS.first,
                      meter_id: @meter.id, measure_process_id: @process.id) }
    Measure.close_process(@process.id)
    Measure.where(measure_process_id: @process.id).each do |m|
      assert_equal m.value,  Measure.where(status: Measure::STATUS.third, meter_id:@meter.id).last.value
    end
  end

end
