class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/items/Figs"
      # Returns the price for figs when you go to this path
      resp.write "#{@@items[0].price}"
    elsif req.path=="/items/Apples"
      # Tells the client the items not found and gives them a 400 error
      resp.write "Item not found"
      resp.status = 400
    else
      # If the path doesn't exist, we tell the client the route can't be found and return a 404 error.
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
