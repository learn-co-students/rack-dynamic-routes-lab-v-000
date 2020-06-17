class Application

  @@items =[]

  def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if !req.path.match(/items/)
      resp.write "Route not found"
      resp.status = 404
  elsif req.path.match(/items/)
    item_name = req.path.split("/items/").last
      @@items.find do |i|
        if i.name == item_name
          resp.write i.price
          resp.status = 200
        else
          resp.write "Item not found"
          resp.status = 400
        end
    end
  end
  resp.finish
  end
end
