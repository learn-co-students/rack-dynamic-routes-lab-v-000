
class Application
   @@items = []

   def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path =~ /items/
         item_name = req.path.split('/items/').last
         item = @@items.find { |item| item.name == item_name }
         !item.nil? ? (resp.write item.price) : (resp.status = 400; resp.write 'Item not found')
      else
         resp.write 'Route not found'
         resp.status = 404
      end

      resp.finish
   end
end
