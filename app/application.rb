class Application

  @@items = [Item.new("Figs", 3.42), Item.new("Pears", 0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      #split the info in the path, use /path/
      item_info = req.path.split('/items/').last

      if item = @@items.find{|i| i.name == item_info}
      resp.write item.price
      else
      resp.status = 400
      resp.write "Item not found"
    end
  else
    resp.status = 404
    resp.write  "Route not found"
  end
    resp.finish
  end
end
