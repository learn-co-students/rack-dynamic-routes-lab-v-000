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

  def self.find_by_name(item_name)
    self.all.find do |item|
      item.name == item_name
    end
  end
end
