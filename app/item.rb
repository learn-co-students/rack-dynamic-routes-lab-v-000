#require_relative './application.rb'
class Item
  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
  end
end
