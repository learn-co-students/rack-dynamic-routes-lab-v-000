class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items = []

    @@items << Item.new("Figs", 3.42)
    @@items << Item.new("Pears", 0.99)

    if req.path.match(/items/)
      i_name = req.path.split("/items/").last
      if item =@@items.detect do |item| #returns first item for which block is not false 
        item.name == i_name
      end
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
