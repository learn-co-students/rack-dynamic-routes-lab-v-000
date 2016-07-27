class Application

  @@items = [Item.new("Item", 25),
            Item.new("Peter", 28)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      # returns item.name
      item_name = req.path.split("/items/").last
      # creates item object
      item = @@items.find{|s| s.name == item_name}
      if item
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
