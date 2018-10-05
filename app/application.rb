class Application
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new



    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      if item = @@items.find{|i| i.name == item_name}
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end
