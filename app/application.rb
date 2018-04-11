
class Application

@@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)




  if req.path.match(/items/)
    item = req.path.split("/").last
      if @@items.include? item
        resp.write "#{Item.price}\n"
      else
        "Item not found"
      end

  else
      resp.write "Route not found"
      resp.status = 404

  end
    resp.finish
  end



end
