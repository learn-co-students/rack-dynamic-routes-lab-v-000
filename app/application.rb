require 'pry'
class Application

  @@items = [Item.new("Apples", "1.62"),
             Item.new("Carrots", "0.47"),
             Item.new("Pears", "0.49")]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find { |i| i.name == item_name }
      if item
        resp.write "#{item.name} cost #{item.price}"
      else
        resp.status = 400
        resp.write "Item not found."
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end