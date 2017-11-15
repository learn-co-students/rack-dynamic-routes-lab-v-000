class Item

  @@items = [ ] # I added

  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self # I added
  end

  def self.items # I added
    @@items
  end

end
