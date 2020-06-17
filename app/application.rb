class Application
#app
@@items = [
  Item.new("Headphones", 15.00),
  Item.new("TV", 200.00)
]

 def call(env)
   resp = Rack::Response.new
   req = Rack::Request.new(env)



   if req.path.match(/items/)
     item_name = req.path.split('/items/').last #item name is here i.e /items/<item_name>
     item = @@items.find{|i| i.name == item_name}
     if item
      resp.write item.price
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
