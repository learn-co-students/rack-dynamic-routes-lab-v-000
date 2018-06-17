class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      desired_item = req.path.split("/items/").last
      item = @@items.find{|i| i.name == desired_item}

      if item
        item_price = item.price
        resp.write "The price is: #{item_price}"
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
