require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Bob")
    # @song1 = Song.new("My beloved monster", "Eels")

  end

  def test_customer_has_a_name()
    assert_equal("Bob", @customer1.name)
  end

end
