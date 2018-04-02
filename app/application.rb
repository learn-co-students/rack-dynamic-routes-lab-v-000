require 'pry'
class Application
# Item is a method that is already giving to use...

      def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)

         item_price = req.path.split("/items/").last

    # i in this case is not for index but for item
          item = @@items.find{|i| i.price == item_price}

          resp.write item.price
        else
          resp.write "Route not found"
          resp.status = 404
        end

        resp.finish

  end
end
