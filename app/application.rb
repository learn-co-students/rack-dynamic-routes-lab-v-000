class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/items/)
      lookfor_item = req.path.split("/items/").last
      @@items.each do |item|
        if item.name == lookfor_item
          price = item.price
          resp.write "The price is #{price}"
          resp.status = 200
          break
        elsif item == @@items.last
          resp.write "Item not found"
          resp.status = 400
        end
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
