class Application

  @@items = [Item.new("Music_Album", 9), Item.new("Shirt", 20)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item = @@items.find{|item| item.name == item_name}
      resp.write "#{item_name}s are $#{item.price}."
      else
        resp.status = 400
        resp.write "Sorry no #{item_name}. Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

end