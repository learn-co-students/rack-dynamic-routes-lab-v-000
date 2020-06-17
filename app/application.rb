class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      potential_item = req.path.split('/').last
      go_to_item = @@items.find{|item| item.name == potential_item}

      if go_to_item
        resp.write "The price of #{go_to_item.name} is #{go_to_item.price}.\n"
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
