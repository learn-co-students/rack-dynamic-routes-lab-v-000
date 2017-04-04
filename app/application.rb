class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_title = req.path.split("/items/").last
      array = @@items.collect{|item| item.name}

      if array.include?(item_title)
        item_instance = @@items.detect{|x| x.name == item_title}
        resp.write item_instance.price
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
