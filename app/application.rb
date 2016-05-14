require 'pry'
class Application
  @@item = [Item.new("Food", 5)]
  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)
    #binding.pry
    if req.path == "/items/testing"
      item = req.path.split("/items/").last
      item
    else
      resp.write "Route not found"
      resp.status = 404
    end
  end
end

# # if the route is not /items/<item name>
# #   return error code 404

# #   if the item is in @@items
# #     return the price
# #   else
# #     return error 400
