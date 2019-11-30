class Room

  attr_reader :name, :max_capacity, :cost
  #playlist_of_songs shall be needed in reader or not?

  def initialize(name, max_capacity, cost, playlist_of_songs = [])
    @name = name
    @max_capacity = max_capacity
    @playlist_of_songs = playlist_of_songs
    @customers_booked = []
    @cost = cost
    @is_booked = is_booked
  end

  def customers_booked_counter()
    return @customers_booked.length
  end

  #Customer could bring friends. There would be one person booking and paying, but more people added to the room.
  def add_customer_and_friends_to_room(customer)
    return if get_status == "full"
    return if @customers_booked.include?(customer)
    return if (customer.friends_number + 1 + customers_booked_counter) > max_capacity
    @customers_booked.push(customer)
    if customer.friends.nil?
      return
    else
      for friend in customer.friends
        @customers_booked.push(friend)
      end
    end
  end

  #NOTE if not found it returns nil, it doesn't break anything
  def remove_customer_and_friends_from_room(customer)
    @customers_booked.delete(customer)
    if customer.friends.nil?
      return
    else
      for friend in customer.friends
        @customers_booked.delete(friend)
      end
    end


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

  def has_capacity_for(customer)
    customer.friends_number + 1 + customers_booked_counter <= max_capacity
  end

  def is_booked
    is_booked = "booked"
  end


end
