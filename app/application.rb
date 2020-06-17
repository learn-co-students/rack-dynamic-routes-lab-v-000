class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last  ##get item_name from /items/item_name
      item = @@items.find{ |i| i.name == item_name}

      if item != nil              ##If the item is found return the price
        resp.write item.price
      else
        resp.write "Item not found"  ##Else tell client not found and return status 400
        resp.status = 400
      end
      
    else
      resp.write "Route not found"  ##path doesn't exist return status 404
      resp.status = 404
    end

    resp.finish
  end
end