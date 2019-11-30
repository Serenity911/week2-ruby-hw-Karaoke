class Room

  attr_reader :name, :max_capacity, :cost
  #playlist_of_songs shall be needed in reader or not?

  def initialize(name, max_capacity, cost, playlist_of_songs = [])
    @name = name
    @max_capacity = max_capacity
    @playlist_of_songs = playlist_of_songs
    @customers_booked = []
    @cost = cost
  end

  def customers_booked_counter()
    return @customers_booked.length
  end

  def add_customer_to_room(customer)
    return if get_status == "full"
    return if @customers_booked.include?(customer)
    @customers_booked.push(customer)
  end

  #NOTE if not found it returns nil, it doesn't break anything
  def remove_customer_from_room(customer)
    @customers_booked.delete(customer)
  end

  def songs_counter()
    @playlist_of_songs.length
  end

  def add_song(song)
    @playlist_of_songs.push(song)
  end

  def remove_song(song)
    @playlist_of_songs.delete(song)
  end

  def get_status()
    customers_booked_counter < @max_capacity ? "free" : "full"
  end


end
