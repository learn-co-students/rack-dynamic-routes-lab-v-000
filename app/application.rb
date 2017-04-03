class Application

  @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_item = req.path.split("/items/")[-1]
      if item = @@items.detect {|i| i.name == search_item}
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
