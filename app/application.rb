class Application

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)
        if req.path.include?("/items/")
      #############
      product = req.path.sub("/items/", "")
      correct_item = @@items.detect do |item|
        item.name == product
      end
      if correct_item == nil
        resp.status = 400
        resp.write "Item not found"
      else
        resp.write(correct_item.price)
      end
      #############
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

end
