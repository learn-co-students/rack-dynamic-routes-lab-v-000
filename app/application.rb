class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_req = req.path.split('/items/').last
      @@items.find do |item| 
        if item.name == item_req
          resp.write item.price
        else
          resp.status = 400
          resp.write "Item not found"
        end
      end
    else 
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
  
  
end