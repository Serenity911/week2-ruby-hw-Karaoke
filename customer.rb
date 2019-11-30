class Customer

  attr_reader :name, :wallet, :friends

  def initialize(name, wallet, friends = [])
    @name = name
    @wallet = wallet
    @friends = friends
  end

  def add_friend(friend)
    @friends << friend
  end

  def friends_number()
    @friends.length
  end

  def sufficient_funds?(room)
    @wallet >= room.cost
  end

  def pays_money(room)
    return if !sufficient_funds?(room)
    @wallet -= room.cost
  end

end

#ADD MONEY
