class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    #Item.new("puppy", "$40")

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if Item.all.any? {|s| s.name == item_name}
        item_object = Item.all.find{|i| i.name == item_name}
        resp.write "#{item_name} found!\n"
        resp.write "#{item_object.price}"
      else
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
