class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/items/").last #turn /items/<item name> into <item name>
      if item = Item.all.find{|s| s.name == item_name}
        resp.write item.price
      else
        #return error and 400 if item is not there
        resp.write "Item not found"
        resp.status = 400
      end
    else
      #return error and 404 for a bad route
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
