class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/item/) 
      item_choice = req.path.split("/")
      item_found = false 
      
      @@items.each do |item|
        if item.name == item_choice[2] 
          
          resp.write "#{item.price}"
          resp.status = 200
          item_found = true 
        end 
      end 
      if item_found == false 
        resp.write "Item not found"
        resp.status = 400
      end 
      #binding.pry
    else 
      resp.write "Route not found"
      resp.status=404
    
    end 
    resp.finish 
  end 
end 