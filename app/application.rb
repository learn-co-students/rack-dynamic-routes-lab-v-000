class Application

  @@items = [Item.new("Wallet", 30.99), Item.new("Chapstick", 1.16)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      requested_item = req.path.split("/items/").last
      if item = @@items.find{ |i| i.name == requested_item}
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
