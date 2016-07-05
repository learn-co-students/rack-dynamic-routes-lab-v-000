class Item
  attr_accessor :name, :price
  @@items = []

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end

  def self.find_item_by_name(name)
    @@items.find {|item| item.name == name}
  end

end
