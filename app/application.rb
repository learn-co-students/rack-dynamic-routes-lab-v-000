class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      find_item = req.path.split("/items/").last
      item = @@items.find{|i| i.name == find_item}
      #if item is withing @@items, then writes the price, else writes "Item not found"
      if @@items.include?(item)
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    #writes "Route not found" and sends 404 status if path not found
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish

  end

end
