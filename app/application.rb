class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)

      item_selected = req.path.split("/items/").last
      item_found = Item.find_by_name(item_selected)
      if item_found
        # binding.pry
        resp.write item_found.price
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
