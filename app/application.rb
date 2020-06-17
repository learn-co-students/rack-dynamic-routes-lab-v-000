class Application

  #@@items = [Song.new("Sorry", "Justin Bieber"), Song.new("Hello","Adele")]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/items/").last #turn /items/Burrito into Burrito
      item = @@items.find{|i| i.name == item_name}
      if item #the item exists
        resp.write item.price
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
