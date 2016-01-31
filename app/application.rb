class Application

  @@items = [Item.new("kindle%20fire", 49.99), Item.new("watch", 75.00)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
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