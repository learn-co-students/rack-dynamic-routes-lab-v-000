require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

      if req.path[0..6] != "/items/"
        resp.write "Route not found"
        resp.status = 404
        else

          if item = @@items.find {|i| i.name == req.path[7..-1]}
           resp.write item.price
          #  binding.pry
          else
           resp.write "Item not found"
           resp.status = 400
          end

        end

    resp.finish
  end
end
