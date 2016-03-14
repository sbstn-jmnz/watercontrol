require 'test_helper'

class CondoTest < ActiveSupport::TestCase
    test "should not save Condo without name" do
      condo = Condo.new
      assert_not condo.save, "shouldn't save condo without a name"
    end
end
