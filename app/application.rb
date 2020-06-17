class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !(req.path.match(/items/))
      resp.write "Route not found"
      resp.status = 404
    else req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item_choice = @@items.find{|product| product.name == item_name}
        if !(@@items.find{|product| product.name == item_name})
          resp.write "Item not found"
          resp.status = 400
        else
          resp.write item_choice.price
        end 
    end

    resp.finish
  end

end
