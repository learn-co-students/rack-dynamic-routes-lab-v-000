class Application
#=========================================================
  attr_accessor :resp
#========================Response=========================
  def call(env)
    self.resp = Rack::Response.new
    req = Rack::Request.new(env)
#-------------------------Routes--------------------------
    # find item
    if req.path.match(/items/)
      find_item(req)
      
    # not found
    else
      write "Route not found"
      resp.status = 404
    end
#---------------------------------------------------------
    resp.finish
  end
#=========================================================
  
  
#========================Helpers==========================
  # write
  def write(this); resp.write this; end
#--------------------------------------------------------- 
  # find item
  def find_item(req)
    item_name=req.path.split("/items/").last
    item=@@items.find{|i| i.name == item_name}
    
    write item.price if item
    write "Item not found" and resp.status = 400 if !item
  end
#=========================================================
end