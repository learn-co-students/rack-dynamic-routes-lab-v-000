class Application

  @@items = [Item.new("Testing",3.33), Item.new("Item2",2.33)]

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      name = req.path.split("/items/").last
      if item = @@items.find{|i| i.name == name}
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
