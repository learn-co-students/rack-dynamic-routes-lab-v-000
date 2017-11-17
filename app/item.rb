class Item

  @@items = []
  @@item_names = []

  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
    @@item_names << name
  end

  def self.all
    @@items
  end

  def self.all_items
    @@item_names
  end

  def self.find_by_name(name)
    @@items.find(name) { |x| x.name == name }
  end
end
