class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    item = req.path.split("/items/").last #turn /songs/Sorry into Sorry

    if req.path.match(/items/)
      match_price = nil
      @@items.each {|thing| match_price = thing.price if thing.name == item}
      if match_price
        resp.write match_price
        else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
