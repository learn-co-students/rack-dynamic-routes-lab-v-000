class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
	  # route has items
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}

      if item
		#item does exitst
        resp.write item.price
      else
		#item does not exists
        resp.write "Item not found"
        resp.status = 400
      end
    else
      # route has no items
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
