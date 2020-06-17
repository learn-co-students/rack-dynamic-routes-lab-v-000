
class Item
  attr_accessor :name, :price

  @@items = []

  def initialize(name,price)
    @name = name
    @price = price
  end

  def self.items
    save
    @@items
  end

  def save
    @@items << self
  end

end
