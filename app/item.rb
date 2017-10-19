class Item

  @@items = []

  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end

  def self.all
    @@items
  end

  def self.find_by(name)
    self.all.detect { |item| item.name == name }
  end
end
