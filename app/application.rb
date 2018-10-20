class Application

  @@item = []

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      item_requested = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_requested}
      if item
        resp.write "#{item.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end

    else
      resp.status = 404
      resp.write "Route not found"
    end


    resp.finish

  end

end
