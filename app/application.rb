class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/items/"
      resp.write "items"
    elsif req.path.match(/items/)
      item_chosen = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_chosen}
      if item
        resp.write item.price
      else
        resp.write "Item not found."
        resp.status = 400
      end
    else
      resp.write "Route not found."
      resp.status = 404
    end
    resp.finish
  end
end
