class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/") == nil
      resp.write "Route not found"
      resp.status = 404  
    else
      cart_items = req.path.split("/items/").last
      cart = @@items.find {|i| i.name == cart_items}
      
      if cart != nil
        resp.write "#{cart.price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    end

    resp.finish
  end

end
