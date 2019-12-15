class Item
  attr_accessor :name, :price
  
  @@items = []

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end
end
  
  #def call(env)
    #resp = Rack::Response.new
    #req = Rack::Request.new(env)
    
    #if req.path.match(/items/)
      #item_name = req.path.split("/items/").last
      #item = Item.find{|s| s.name == item_name}
      #if !item
        #resp.write "Item not found"
        #resp.status 400
      #else
        #resp.write item.price
      #end 
    #else 
      #resp.write "Error!"
      #resp.status 404
  #  end
  #end
#end