class Application

  @@items = [Item.new("Sorry", "Justin Bieber"),
            Item.new("Hello","Adele")]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      item = req.path.split("/items/").last
      item = @@items.find do |product|
        product.name == item
        end
        if !item
          resp.write "Item not found"
          resp.status = 400
        else
          resp.write item.price
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end
     resp.finish
  end
end
