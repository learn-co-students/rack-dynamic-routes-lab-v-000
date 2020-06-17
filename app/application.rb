class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items")
      item_param = req.path.split('items/').last
      if found = @@items.detect{|item| item.name == item_param}
        resp.write(found.price)
        resp.status = 200
      else
        resp.write("Item not found")
        resp.status = 400
      end
    else
      resp.write("Route not found")
      resp.status = 404
    end
    resp.finish
  end
end
