class Application
  @@items = [Item.new("Phone", 980.99), Item.new("Charger", 5.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_path = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_path}
      if @@items.include?(item)
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
