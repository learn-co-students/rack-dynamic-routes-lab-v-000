class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_item = req.path.split("/items/").last
      return_item = nil

      @@items.each do |item|
        item.name == search_item ? return_item = item : false
      end

      if return_item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{return_item.name} costs #{return_item.price}"
        resp.status = 200
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
