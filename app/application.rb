class Application

  @@items =[Item.new("Apples",4),
  Item.new("Kiwis", 5)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Response.new(env)

    if req.path.match(/item/)

      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}

     resp.write item.price
   else
     resp.write "Route not found"
     resp.status = 404
   end

   resp.finish
 end

end
