require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require("pry")
# binding.pry

require_relative("../venue")
require_relative("../room")


class VenueTest < MiniTest::Test

  def setup
    @venue = Venue.new("The Codeclan Caraoke")
    @room1 = Room.new("The blue room", 2, 10, "free")
    # @customer1 = Customer.new("Bob")
    # @customer2 = Customer.new("Petra")
    # @customer3 = Customer.new("Alex")
    # @customer4 = Customer.new("Alex")
  end


  def test_venue_has_name
    assert_equal("The Codeclan Caraoke", @venue.name)
  end

  def test_venue_starts_with_zero_rooms
    assert_equal(0, @venue.numbers_of_rooms)
  end

  def test_adds_rooms_to_venue
    @venue.adds_room(@room1)
    assert_equal(1, @venue.numbers_of_rooms)
  end

  def test_till_starts_at_zero
    assert_equal(0, @venue.till)
  end

  def test_add_money_to_till
    @venue.add_money(1)
    assert_equal(1, @venue.till)
  end

  def test_find_free_room
    @venue.adds_room(@room1)
    @venue.find_free_room
    assert_equal("The blue room",@venue.find_free_room.name)
  end

end
