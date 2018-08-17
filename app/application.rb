class Application 
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      search_term = req.params["Item_name"]
      @@items.each do |item|
        resp.write item.price
      end 
      resp.status = 200
    else 
      resp.write "Item not found"
      resp.status = 400
    end 
    if !req.path.match(/items/)
      resp.status = 404
      resp.write "Route not found"
    end 
     
  end 

end 