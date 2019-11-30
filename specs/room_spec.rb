require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require("pry")
# binding.pry

require_relative("../room")
require_relative("../customer")


class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("The blue room", 2, 10)
    @customer1 = Customer.new("Bob", 20)
    @customer2 = Customer.new("Petra", 10)
    @customer3 = Customer.new("Alex", 10)
    @customer4 = Customer.new("Alex", 29)
    @friend1 = "Alex"
    @friend1 = "Miriam"



  end

  def test_customers_booked_counter_is_zero_at_start()
    assert_equal(0, @room1.customers_booked_counter)
  end

  def test_add_customer_zero_friends_to_room()
    @room1.add_customer_and_friends_to_room(@customer1)
    assert_equal(1, @room1.customers_booked_counter)
  end

  def test_add_customer_and_one_friend_to_room()
    @customer1.add_friend(@friend1)
    @room1.add_customer_and_friends_to_room(@customer1)
    assert_equal(2, @room1.customers_booked_counter)
  end

  def test_do_not_re_add_customer_if_already_in_the_room()
    @room1.add_customer_and_friends_to_room(@customer1)
    @room1.add_customer_and_friends_to_room(@customer1)
    assert_equal(1, @room1.customers_booked_counter)
  end

  def test_remove_customer_and_friends_from_room()
    @room1.add_customer_and_friends_to_room(@customer1)
    @room1.remove_customer_and_friends_from_room(@customer1)
    assert_equal(0, @room1.customers_booked_counter)
  end

  def test_do_not_remove_customer_from_room_if_not_booked()
    @room1.add_customer_and_friends_to_room(@customer1)
    @room1.remove_customer_and_friends_from_room(@customer2)
    assert_equal(1, @room1.customers_booked_counter)
  end

  def test_playlist_starts_empty()
    assert_equal(0, @room1.songs_counter)
  end

  def test_add_song()
    @room1.add_song(@song1)
    assert_equal(1, @room1.songs_counter)
  end

  def test_remove_song()
    @room1.add_song(@song1)
    @room1.remove_song(@song1)
    assert_equal(0, @room1.songs_counter)
  end

  def test_room_max_capacity()
    assert_equal(2, @room1.max_capacity)
  end

  def test_room_is_free_if_just_one_customer()
    @room1.add_customer_and_friends_to_room(@customer1)
    assert_equal("free", @room1.get_status)
  end

  def test_cannot_add_customer_to_full_room()
    @room1.add_customer_and_friends_to_room(@customer1)
    @room1.add_customer_and_friends_to_room(@customer2)
    assert_equal("full", @room1.get_status)
  end

  #ADD TEST CANNOT BOOK A ROOM THAT DOES NOT EXIST

  def test_room_has_a_cost()
    assert_equal(10, @room1.cost)
  end

  def test_room_has_capacity_for
    @customer1.add_friend(@friend1)
    assert_equal(true, @room1.has_capacity_for(@customer1))
  end

  def test_room_has_capacity_for
    @customer1.add_friend(@friend1)
    @customer1.add_friend(@friend2)
    assert_equal(false, @room1.has_capacity_for(@customer1))
  end

  def test_room_has_a_booked_status
    assert_equal("booked", @room1.is_booked)
  end

end
