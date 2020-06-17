class Item
  attr_accessor :name, :price

  @@items = []

  def self.all
    @@items.dup.freeze
  end

  def initialize(name,price)
    @name = name
    @price = price
    save
  end

  def save
    @@items << self
  end
end
