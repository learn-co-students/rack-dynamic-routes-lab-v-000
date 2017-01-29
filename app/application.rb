class Application
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    Item.new("iPhone", 25)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      res = Item.all.find {|it| it.name == item}
      if res
        resp.write(res.price)
      else
        resp.status = 400
        resp.write("Item not found")
      end
      #resp.write(Item.all.collect {|i| i.name})
    else
      resp.status = 404
      resp.write("Route not found")
    end
    resp.finish
  end
end