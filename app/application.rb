class Application

   attr_accessor :item

   def call(env)
     resp = Rack::Response.new
     req = Rack::Request.new(env)

     if req.path=="/testing"
       resp.write "Route not found"
       resp.status = 404
     elsif req.path=="/items/Figs"
       resp.write "#{@@items}.price"

     else
       resp.write "Item not found"
       resp.status = 400
     end

     resp.finish
   end
 end
