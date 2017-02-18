class Item
  attr_accessor :name, :price
  @@item = []

  def initialize(name,price)
    @name = name
    @price = price
    @@item << self 
  end

  def self.all
    @@item
  end

  def self.find_by_name(item_name)
    self.all.find do |item|
      item.name == item_name
    end
  end

end
