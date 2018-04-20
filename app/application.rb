require 'pry'


class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    binding.pry
    if req.path.match(/items/)
      item_name = req.path.split("/")[-1]
      @@items.each do |item|
        if item.name == item_name
          resp.write item.price
          return resp.finish
        end
      end
      resp.write "Item not found"
      resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
