class Item
  attr_accessor :name, :price

  @@items = []

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end

  def self.find_by_name(search_term)
    @@items.detect do |item|
      item.name.downcase == search_term.downcase
    end
  end

end
