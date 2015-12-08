class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      the_item = req.path.split("/items/").last
      found = @@items.find{|a| a.name == the_item}
      if found.nil?
        resp.status = 400
        resp.write "Item not found"
      else
        resp.write "#{found.price}"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end