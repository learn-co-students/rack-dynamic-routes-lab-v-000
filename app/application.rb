require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path != "/items"
    resp.write "Route not found"
    resp.status = 404
    else

       @@items.select do |i|
      if i.name = req.path[7..-1]
       i.price
       binding.pry
      else
       resp.write "Item not found"
       resp.status = 400
     end
    end
  end

    resp.finish
  end


end
