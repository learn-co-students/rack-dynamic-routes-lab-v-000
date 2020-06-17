class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
       item_name = req.path.split("/items/").last #turn /items/Apples into Apples
       item_instance = Item.items.find{|i| i.name == item_name}
       if item_instance #if we found an instance that has a name matching our search
         resp.write item_instance.price
         resp.status = 200
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
