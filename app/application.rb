class Application 
  
  @@items = []
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/) #
      item_name = req.path.split('/').last
      item = @@items.find do |i|
        i.name == item_name #checks to see if 'item' matches list of items in array 
      end
        if item.nil?
          resp.status = 400
          resp.write "Item not found"
         else 
           resp.write "#{item.price}"
        end
    
    
    # elsif req.path.match(/items/)
    # elsif item = true 
    # req.write "#{item.price}"
    else 
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
  
  
end