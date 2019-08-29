class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items\/.*/)
      cart_item = req.path.split("items/")[1]
      matched = @@items.detect { |item| item.name == cart_item }
      if matched
        resp.write matched.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
