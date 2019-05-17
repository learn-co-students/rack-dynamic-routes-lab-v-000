class Item

    @@items = []

  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    @@items << {@name => @price}
  end
end
