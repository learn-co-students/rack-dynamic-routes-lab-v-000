class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/\/items\/\w+/)
      item = req.path.split("/items/").last
      item_in_stock = @@items.detect{|i| i.name == item}
      if item_in_stock
        resp.write item_in_stock.price
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