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

  def add_money(money)
    @till += money
  end

  def find_free_room
    @rooms.find{|room| room.get_status == "free"}
  end

end
