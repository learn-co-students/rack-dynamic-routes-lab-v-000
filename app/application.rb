require 'pry'
class Application
@@items = [Item.new("Choc", 2.33), Item.new("Noodles", 3.09)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      if final = @@items.detect {|i| i.name == req.path.split("/items/")[1]}
        resp.write final.price
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
