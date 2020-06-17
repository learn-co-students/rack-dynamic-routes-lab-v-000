class Item
  attr_accessor :name, :price
  @@all = []

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end

  def Item.find_by_name(name)
    
    if @@all.detect{|item| item.name == name}
      @@all.detect{|item| item.name == name}
    else
      nil
    end

  end
end
