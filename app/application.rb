class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env) 
    
    if req.path.match(/items/)
      item = req.path.split('/items/').last
      
      if item_available?(item)
        item_obj = find_by_name(item)
        resp.write "#{item_obj.price}"
        resp.status = 200
        
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
  
  # yay helper functions
  def find_by_name(item_name)
    #finds a item by name and returns an instance of an Item 
    @@items.detect{|i| i.name == item_name}
  end 
  
  def item_available?(item_name)
    !!find_by_name(item_name)
  end 
  
end 