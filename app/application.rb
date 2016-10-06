class Application

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_item = req.params["item"]
      @@items. each do |item|
        if item.name == search_item
          return item.price
        end
      end
      resp.status == 400
      resp.write "Item not found."
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

end
