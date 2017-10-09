class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    item_name = req.path.split("/items/").last
    if req.path.match("/items/") && @@items.find {|i| i.name == item_name}
      item = @@items.find {|i| i.name == item_name}
      resp.write "#{item.price}"
    elsif req.path.match("/items/") && @@items.none?{|i| i.name == item_name}
      resp.write "Item not found"
      resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end


end
#req.path.match(/items/) &&
