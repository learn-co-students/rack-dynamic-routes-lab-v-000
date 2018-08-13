class Application

    @@items = []
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

      if req.path.include?("/items")
       variable = req.path.split("/")
       item = variable.last
       found_item = @@items.find do |i|
        i.name == item
       end
       if found_item.nil?
        resp.status = 400
        resp.write "Item not found"
       else
        resp.write found_item.price
       end

      else
        resp.write "Route not found"
        resp.status = 404
      end

      resp.finish
    end


end
