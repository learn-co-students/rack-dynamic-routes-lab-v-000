class Application
  @@items = [Item.new("apple", 2.00), Item.new("banana", 3.42), Item.new("milk", 4.00), Item.new("steak", 5.00)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if !!@@items.detect {|item| item.name == item_name}
        item = @@items.detect {|item| item.name == item_name}
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end