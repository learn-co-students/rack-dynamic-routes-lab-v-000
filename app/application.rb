class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    search_term = req.params["q"]
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if Item.all.find{|i| i.name == item_name}
      item_we_have = Item.all.find{|i| i.name == item_name}
      resp.write "#{item_we_have.price}"
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
