class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      i = req.path.split("/items/").last
      target = @@items.find {|item| item.name == i}
      if target.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write target.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end