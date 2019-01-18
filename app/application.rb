class Application 
  @@items = [] # Each item has a name and a price
  
  def call(env) 
    req = Rack::Request.new(env)
    resp = Rack::Response.new
    
    if req.path.match(/items/)
      requested_item = req.path.split("/items/").last #[<domain/path>, <Item Name>].last
      found_item = @@items.detect {|item| item.name == requested_item}
      
      if found_item # Item object or nil
        #TODO: finish this part.
      else 
        #TODO: finish this part.
      end
    else 
      resp.write "Route not found"
      resp.status = 404
    end 
    
    resp.finish
  end
end