class Application

  @@items = []

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_item = req.path.split("/items/").last.capitalize
      
      found_item = @@items.detect{|item| item.name == search_item}

      if found_item
        resp.write "#{found_item.price.to_s}"
      else
        resp.status = 400
        resp.write "Item not found"
      end

    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
  
end