class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

      if req.path.match(/items/)
        item = req.path.split("/items/").last

        if @@items.find {|i| i.name == item}
          item_found = @@items.find {|i| i.name == item}
          resp.write item_found.price
        else
          resp.write "Item not found"
          resp.status = 400
        end
      elsif !req.path.match(/items/)
        resp.write "Route not found"
        resp.status = 404
      end

    resp.finish
  end
end
