class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !req.path.match(/items/)
      resp.status = 404
      resp.write "Route not found"
    else
      item_name = req.path.split("/items/")[1]
      item = @@items.detect {|item| item.name == item_name}
      if item.nil?
        resp.status = 400
        resp.write "Item not found"
      else
        resp.write item.price
      end
    end

    resp.finish
  end

end
