class Item
  attr_accessor :name, :price
  @@all = []
  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end
  def self.find_by_name(item_name)
    Item.all.find {|i| i.name == item_name}
  end
  def self.all
    @@all
  end


end
