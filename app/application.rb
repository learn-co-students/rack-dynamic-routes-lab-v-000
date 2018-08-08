require 'pry'

class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
     
        if req.path.match(/items/)
          item_name = req.path.split("/items/").last
          item = @@items.find{|s| s.price == item_price}
        else
            resp.write "Item Not Found"
            resp.status = 404
        end
     
        resp.finish
      end
    
end