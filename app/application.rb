class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last   # Get item name
      item = @@items.find{|i| i.name == item_name}
      # if item not nil
      #   resp.write item.price
      # else
      #   resp.write "Item Not Found"
      #   resp.status = 404
    else
      resp.write "Route not found"
      resp.status = 404
    end

    # Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
    # If a user requests /items/<Item Name> it should return the price of that item
    # IF a user requests an item that you don't have, then return a 400 and an error message

    resp.finish
  end

end
