class Application 
  @@items = [] 

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/").last
      item = @@items.find {|s| s.name == item_name}

      if item != nil
        [200, {"Content-Type" => "text/plain"}, ["#{item.price}"]]
      else
        [400, {"Content-Type" => "text/plain"}, ["Item not found"]]
      end
    else
      [404, {"Content-Type" => "text/plain"}, ["Route not found"]]
    end

  end

end
