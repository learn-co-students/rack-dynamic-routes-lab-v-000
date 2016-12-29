class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_req = req.path.split("/items/").last

      item = @@items.find{|item| item.name == item_req}

      resp.write item.price
    else
      resp.write "File not found"
      resp.status = 404
    end
  end
end
