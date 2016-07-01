class Item
  attr_reader :name, :price
  @@item = []

  def initialize(name,price)
    @name = name
    @price = price
    @@item << self
  end

  def self.item_list
    @@item
  end

end
