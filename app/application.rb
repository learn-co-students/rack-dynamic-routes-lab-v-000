class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if find_item_by_name(item_name) != nil
        resp.write find_item_by_name(item_name).price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

  def find_item_by_name(name)
    found = nil
    @@items.each do |item|
      if item.name == name
        found = item
      end
    end
    found
  end

end
