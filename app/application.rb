class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_title = req.path.split("/items/").last
      item = @@items.find{ |i| i.price == item_title }
      resp.write item
    else
    resp.write "Route not found"
    resp.status = 404

    resp.finish
    end
  end

  # if req.path.match(/songs/)
  #   song_title = req.path.split("/songs/").last
  # end

end
