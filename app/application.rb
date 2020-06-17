class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
 
      item_name = req.path.split("/items/").last
      item = @@items.find{|t| t.name == item_name}
      if item == nil
        resp.status = 404
      else
        resp.write item.price
      end
    else
      resp.write "Route not found"
    end
  end
end