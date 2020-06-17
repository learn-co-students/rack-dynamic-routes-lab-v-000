class Application
 
@@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
 
def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
	  
      requested_item = req.path.split("/items/").last 
      #note find returns the first entry for which block is not false
      # in other words, the thing whose price we want
      
      #if you find the item, show the price
      if @@items.find{|item| item.name == requested_item}
      resp.write @@items.find{|item| item.name == requested_item}.price
      resp.status = 200
      else
        resp.status = 400
        resp.write " Item not found"
      end

    else
        resp.status = 404
        resp.write "Route not found"
    end
 


resp.finish
#eom
end

#--
end
