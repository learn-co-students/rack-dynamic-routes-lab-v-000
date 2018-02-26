class Item
  attr_accessor :name, :price
  @@items = []
  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end

  def self.all
    @@items
  end
end

# Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
# If a user requests /items/<Item Name> it should return the price of that item
# IF a user requests an item that you don't have, then return a 400 and an error message
