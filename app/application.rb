class Application
  @@items = []

  def call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    if req.path.match(/items\/\w+/)
      name = req.path.split("/items/").last
      item = @@items.find { |item| item.name == name }
      if item.nil?
        res.write "Item not found"
        res.status = 400
      else
        res.write item.price 
        res.status = 200
      end
    else
      res.status = 404
      res.write "Route not found"
    end
    res.finish
  end
end