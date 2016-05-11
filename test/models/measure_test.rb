require 'test_helper'

class MeasureTest < ActiveSupport::TestCase

  setup do
    @meter =  create( meter:, number: 15, status: Meter::STATUS.first)
    @user = create( user:, name:'Test Name', email: 'test@mail.com',password: 'secretpass', rut: '11.111.111-1')
  end

  test 'should not save measure without value' do
     measure = create measure:
     assert_not measure.valid?
     assert_equal [:value], measure.errors.keys
  end

  test 'asscociations on meter and user' do
    2.times { @meter.measures.create(value: 15, user_id: @user.id) }
    assert_equal(2, @meter.measures.count, "Unexpected meter record count")
    assert_equal(2, @user.measures.count, "Unexpected user record count")
  end

end
