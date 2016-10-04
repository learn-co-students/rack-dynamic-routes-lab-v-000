class Application

  def call

    resp = Rack::Response.new
    req = Rack.Require.new(env)

    if req.path.match(/items/)
      search_item = req.params["item"]
      resp.write(search_item.price)
    else
      resp.status = 404
      resp.write "Item  not found"
    end
    resp.finish
  end

end
