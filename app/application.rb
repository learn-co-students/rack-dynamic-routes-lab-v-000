class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_requested = req.path.split("/items/").last

      if Item.find_item_by_name(item_requested)
        resp.write "#{Item.find_item_by_name(item_requested).price}"
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
