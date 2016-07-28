class Application
  @@items = [Item.new("TestItem", 1.00)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      search = req.path.split("/items/").last
      found = nil
      @@items.each do |item|
        if item.name == search
          found = item
          break
        end
      end
      if found.nil?
        resp.status = 400
        resp.write "Item not found. Sorry!"
      else
        resp.write found.price
      end
    else
      resp.status = 404
      resp.write "Error 404 - Route not found!"
    end
    resp.finish
  end
end