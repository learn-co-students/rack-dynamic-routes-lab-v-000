class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      #if item name is found in @@items, return item price
      #if not, resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end
  end

end
