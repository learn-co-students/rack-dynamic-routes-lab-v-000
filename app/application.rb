class Application
  @@items = [Item.new("Apple", "0.75$"),
                        Item.new("Figs", "1.00$")]

  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_type = req.path.split("/items/").last
      item = @@items.find do |i|
        i.name == item_type
      end
      if item
        resp.write item.price
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
