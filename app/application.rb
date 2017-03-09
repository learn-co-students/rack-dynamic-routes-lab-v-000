require 'pry'
class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match("/items/")
            item = req.path.split("/items/").last
            index = []
            @@items.each_with_index { |it,ind|
                if it.name.downcase == item.downcase
                     index = ind
                end
                }
            if index == []
#                binding.pry
                resp.status = 400
                resp.write "Item not found"
            else
                resp.write @@items[index].price
            end
        else
            resp.status = 404
            resp.write "Route not found"
            
        end

        resp.finish
    end
end