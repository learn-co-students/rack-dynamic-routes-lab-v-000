class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      # search_item = req.params["item"]
      item_name = req.path.split("/items/").last
      # item = @@items.find{|i| i.name == item_name}
      # binding.pry

      # if item !=nil
      if item = @@items.find{|i| i.name == item_name}
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
