class Application

  def call(env)

    resp = Rack::Response.new

    req = Rack::Request.new(env)
    if req.path.match(/\/items\/.*/)
      item_req = req.path.split("/").last
      if Item.all_items.include?(item_req)
        price = Item.find_by_name(item_req).price
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
