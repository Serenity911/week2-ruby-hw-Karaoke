require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")
require_relative("../room")

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Bob", 20)
    @friend1 = "Alex"
    @friend2 = "Jane"
    @room1 = Room.new("The blue room", 2, 10)
    @room2 = Room.new("The purple room", 20, 10)

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

  def test_customer_has_sufficient_funds
    assert_equal(true, @customer1.sufficient_funds?(@room1))
  end

  def test_customer_has_exact_funds
    assert_equal(true, @customer1.sufficient_funds?(@room2))
  end

  def test_customer_pays_money
    assert_equal(10, @customer1.pays_money(@room1))
  end

end
