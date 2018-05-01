class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("items")
      name = req.path.split("items").last
      chosen_item = @@items.select{|item|item.name == name}
      if chosen_item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{chosen_item.name}\n price: #{chosen_item.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
  end
end
