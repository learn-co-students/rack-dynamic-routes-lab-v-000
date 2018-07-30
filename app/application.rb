class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      search_item = req.path.split("/items/").last
      new_item = @@items.find { |i| i.name == search_item}
      if @@items.include?(new_item)
        resp.write "#{new_item.price}"
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
