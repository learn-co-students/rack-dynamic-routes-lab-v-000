class Application

  @@items = [Item.new("DS", 999)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.detect { |item| item.name == item_name }
      if item
        resp.write("#{item.name}: $#{item.price}")
      else
        resp.write("400 Item not found")
        resp.status = "400"
      end
    else
      resp.write("404: Route not found")
      resp.status = 404
    end
    resp.finish
  end
end
