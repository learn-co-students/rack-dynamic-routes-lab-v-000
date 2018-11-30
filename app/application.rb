class Application
  
  @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    path = req.path
    
    if path.match(/items/)
      item_from_params = path.split("/items/").last
      if item = @@items.find{|i| i.name == item_from_params}
        resp.write item.price
      else 
        resp.status = 400
        resp.write "Item not found"
      end
      
    else
      resp.status = 404
      resp.write "Route not found."
      end
      
    resp.finish
  end
  
  
end #Class End