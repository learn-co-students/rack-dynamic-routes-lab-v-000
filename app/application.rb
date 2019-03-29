class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !req.path.match(/items/)
      resp.write "Route not found"
      resp.status = 404
    # elsif
    #   req.path.include?(/items/)
    #   resp.write item.price
    else
      resp.write "Item not found"
      resp.status = 400
    end
    resp.finish
  end
end
