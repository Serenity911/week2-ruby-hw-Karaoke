require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Bob")
    @friend1 = "Alex"
    @friend2 = "Jane"
    # @song1 = Song.new("My beloved monster", "Eels")

  end

  def test_customer_has_a_name()
    assert_equal("Bob", @customer1.name)
  end

  def test_customer_has_no_friend
    assert_equal(0, @customer1.friends_number)
  end

  def test_customer_brings_two_friends
    @customer1.add_friend(@friend1)
    @customer1.add_friend(@friend2)
    assert_equal(2, @customer1.friends_number )
  end

end
