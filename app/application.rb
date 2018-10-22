class Application
   @@items = []
   def call(route)
    resp = Rack::Response.new
    req = Rack::Request.new(route)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if list = @@items.find{|f| f.name == item_name}
        resp.write list.price
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
