class Application
@@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      items = req.path.split("/items/").last
       if item_found = @@items.find{|s| s.name == items}

         resp.write item_found.price
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
