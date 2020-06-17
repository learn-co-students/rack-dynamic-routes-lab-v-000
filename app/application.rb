class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      requested_item = req.path.split("/items/").last
      if found_item = Item.all.find {|item| item.name == requested_item}
        resp.write found_item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    elsif req.path.match(/testing/)
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
