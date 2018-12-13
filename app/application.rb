class Application < Item

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = Item.all.find { |i| i.name == item_name }
      resp.write item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end
  end

end
