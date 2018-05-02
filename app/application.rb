
class Application

  @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("items")
      name = req.path.split("items/").last
      chosen_item = @@items.select{|item|item.name == name}
      if chosen_item == []
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{chosen_item.first.name}\n price: #{chosen_item.first.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
