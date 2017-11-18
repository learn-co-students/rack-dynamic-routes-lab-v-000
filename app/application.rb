class Application
  @@items = Array.new
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

   if req.path.match(/items/)
     item = req.path.split('/items/').last
     found_item = @@items.find{|obj| obj.name == item}
     if !!found_item
       resp.write "#{item} costs $#{found_item.price}"
     else
       resp.write "Item not found."
       resp.status = 400
     end
   else
     resp.write "Route not found."
     resp.status = 404
   end

   resp.finish
  end
end
