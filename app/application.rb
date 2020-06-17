# Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
# If a user requests /items/<Item Name> it should return the price of that item
# IF a user requests an item that you don't have, then return a 400 and an error message
class Application

  @@items = [Item.new("Figs",3.42), Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
        if item =@@items.find do |i|
          i.name == item_name
          end
          resp.write item.price

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
