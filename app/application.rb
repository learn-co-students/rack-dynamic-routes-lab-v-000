class Application 
  # @@items = [Item.new("disc",3.42),Item.new("paper",4.89)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      
      item_name = req.path.split("/items/").last # Need to get the item_name from the path 
          
      if @@items.find{|s| s.name == item_name}
      resp.write = item.price
      resp.status = 200
        
      else 
        resp.write "Item not found"
        resp.status = 400
      end 
    else 
      resp.status = 404
      resp.write "Route not found"
    end 
     
  end 

end 