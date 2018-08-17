class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/) #only execute code below if /items/ requested
      #grab the item requested, dynamically
      item_request = req.path.split("/items/").last

      item_found =  @@items.find{|obj| obj.name == item_request}

      if item_found
        resp.write "Item: #{item_found.name}\n"
        resp.write "Price: $#{item_found.price}"
      else #Item cannot be found
        resp.write "Item not found"
        resp.status = 400
      end
    else #no other path defined, so respond with error
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
