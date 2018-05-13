class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/\/items\//)
      # if the route is /items

      req_item = req.path.split('/')[2]
      found_item = @@items.find do |item|
        item.name == req_item
      end

      if found_item # and the item exists
        resp.write found_item.price

      else # if the item doesn't exist
        resp.write 'Item not found'
        resp.status = 400
      end
    else
      # if the route doesn't exist

      resp.write 'Route not found'
      resp.status = 404

    end

    resp.finish
  end
end
