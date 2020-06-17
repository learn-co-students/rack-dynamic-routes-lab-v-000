class Application

  @@items = []

  def call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.detect { |item| item.name == item_name }
      if @@items.include?(item)
        res.write "#{item.price}"
      else
        res.write "Item not found"
        res.status = 400
      end
    else
      res.write "Route not found"
      res.status = 404
    end

    res.finish

  end
end
