class Item
  attr_accessor :name, :price

  @@items = []

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end

  def self.find(item)
    price = 0
    @@items.each do |i|
      if i.name == item
        price = i.price
      end
    end
    price
  end

end
