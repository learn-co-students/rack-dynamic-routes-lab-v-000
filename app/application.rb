require 'pry'

class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      binding.pry
      the_item = req.path.split("/items/").last

      if @@items.include?(the_item)
        return the_item.price
      else
        return "Item not found"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
