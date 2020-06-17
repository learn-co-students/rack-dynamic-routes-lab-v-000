class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      item_obj = @@items.find{|s| s.name == item}
      if @@items.include?(item_obj)
        resp.write "#{item_obj.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
