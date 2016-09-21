class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

     if req.path == "/items"
       item_name = req.path.split("/items/").last
       if Item.all_items.find{|i| i.name == item_name}
         item = Item.all_items.find{|i| i.name == item_name}
         resp.write item.name
       else
         resp.write "Item not found"
         resp.status = 400
       end

     else
      resp.write "Route not found"
      resp.status = 404
    end
  end
end
