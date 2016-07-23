class Application
  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/items"
      item_title = req.path.split("/item/").last
      item = @@item.find{|i| i.title == item_title}

      resp.write item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
