class Item
  attr_accessor :name, :price

  # @@all = [Item.new("Figs", 3.42), Item.new("Pears", 0.99)]

  def initialize(name, price)
    @name = name
    @price = price
  end

end
