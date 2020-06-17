# Shopping Cart Rack App Returns 404 for a bad route
# Shopping Cart Rack App /items Returns item price if it is in @@item
# Shopping Cart Rack App /items Returns an error and 400 if the item is not there
class Application

  @@items = [Item.new("Figs",3.42), Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item = @@items.find{|s| s.name == item_name}
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
