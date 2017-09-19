class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item = req.path.split("/items/").last
      requested_item = @@items.find{|i| i.name == item}
      #turn /items/NAME into NAME
      if requested_item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write requested_item.price
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
