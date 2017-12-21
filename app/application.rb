class Application

  @@items = []

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      path_item = req.path.split('/items/').last
      if @@items.any?{|item| item.name == path_item}
        resp_item = @@items.select {|item| item.name == path_item}.first
        resp.write "#{resp_item.price}"
        resp.status = 200
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
