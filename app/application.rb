class Application 
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      result = is_match?(item_name)
      if result == "Item not found"
        resp.write result
        resp.status = 400
      else 
        resp.write result
      end 
      
    else 
      resp.write is_not_match?
      resp.status = 404
    end
    resp.finish
  end 
  
  def is_match?(item_name)
    if  @@items.find{|s| s.name == item_name}
        name = @@items.find{|s| s.name == item_name}
        return name.price
      else 
        return "Item not found"
        resp.status = 400
      end 
  end 
  
  def is_not_match?
    return "Route not found"
      #resp.status = 404
  end 
end 