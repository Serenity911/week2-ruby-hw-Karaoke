class Venue

  attr_reader :name, :till

  def initialize(name, rooms = [])
    @name = name
    @rooms = rooms
    @till = 0
  end

  def numbers_of_rooms
    @rooms.length
  end

  def adds_room(room)
    @rooms.push(room)
  end

  def add_money(room)
    @till += room.cost
  end

  def find_free_room
    @rooms.find_all{|room| room.get_status == "free"}
  end

  def booking_a_room(customer)
    free_room_for_customer_and_friends = find_free_room.find do
      |room| room.has_capacity_for(customer)
    end
    return if free_room_for_customer_and_friends.nil?
    return if customer.sufficient_funds?(free_room_for_customer_and_friends) == false
    customer.pays_money(free_room_for_customer_and_friends)
    add_money(free_room_for_customer_and_friends)
    free_room_for_customer_and_friends.add_customer_and_friends_to_room(customer)
    free_room_for_customer_and_friends.is_booked
  end

  #TODO CREATE THE FUNCTION TO CHECK OUT CUSTOMER AND FREE THE ROOM
  #CREATE A CLASS BAR THAT SELLS DRINKS
  #ADD A PLAYLIST TO THE VENUE SO PEOPLE CAN ONLY SELECT SONGS FROM THAT
  #CUSTOMER SHOULD HAVE A DEFAULT REACTION TO SONGS IN PLAYLIST (SING) BUT IF ITS THEIR FAVOURITE  THEI CHEER TOO

end
