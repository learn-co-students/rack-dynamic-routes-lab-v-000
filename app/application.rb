class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    item_name = req.path.split("/items/").last
    item = Item.items.find{|item| item.name == item_name}
    
    if req.path.match("/items/") && item
      resp.write "#{item.name}: $#{item.price}."
    elsif req.path.match("/items/") 
      resp.write "Item not found"
      resp.status = 400
    else 
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
