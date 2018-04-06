require 'pry'
class Application
  # Item is a method that is already giving to use...
   # it is possible to have an If statement with another if statement.

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/items/").last
        # i in this case is not for index but for item
        item = @@items.find{|i| i.name == item_name}

      if item
        # item.price   it look for the price afterwards.
        resp.write "#{item.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"xs
      resp.status = 404
    end
    resp.finish
  end
end
