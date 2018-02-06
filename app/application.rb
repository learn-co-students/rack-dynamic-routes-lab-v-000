class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      desired_item_name = req.path.split(/items\//).last

      desired_item = @@items.find {|item|
      desired_item_name == item.name}

      if desired_item
        resp.write desired_item.price
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
end
