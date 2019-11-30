class Customer

  attr_reader :name, :friends

  def initialize(name, friends = [])
    @name = name
    @friends = friends
  end

  def add_friend(friend)
    @friends << friend
  end

  def friends_number()
    @friends.length
  end

end

#ADD MONEY
