class Application 
  
  def call(env) 
    resp = RacK::Response.new 
    req = Rack::Request(env) 
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if @@items.find{|i| item.name = item_name}
        resp.write item.price
      end 
    else 
  end
end