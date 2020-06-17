class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    item = req.path.split("/items/").last

    if req.path.include?("/items")
      price = Item.find(item)
      if price > 0
        resp.write "#{price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
       resp.write "Route not found"
       resp.status = 404
     end

    resp.finish
  end
end
