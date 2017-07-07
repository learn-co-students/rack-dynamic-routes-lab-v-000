#1. Your application should only accept the `/items/<ITEM NAME>` route. Everything else should `404`
#2. If a user requests `/items/<Item Name>` it should return the price of that item
#3. IF a user requests an item that you don't have, then return a `400` and an error message
#require_relative './item.rb'
class Application
  @@item = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
  def call(env)
    resp = Rack::Response.new   #sets instantiated Response to resp
    req = Rack::Request.new(env)#sets instantiated request to req

    if req.path.match(/items/)

      item_title = req.path.split("/items/").last
      if item = @@item.find{|s| s.name == item_title}
      resp.write item.price
    else
      resp.write "Item not found"
      resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
#https://learn.co/tracks/full-stack-web-dev-with-react/rack/rack-and-the-internet/http-status-codes
#https://learn.co/tracks/full-stack-web-dev-with-react/rack/rack-and-the-internet/dynamic-url-routes
