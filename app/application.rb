

class Application 
  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)



    if req.path.match(/items/)

      item_name = req.path.split("/items/").last 
      
        thing = @@items.find {|x| x.name == item_name}

        if thing == nil
          resp.write "Item not found"
          resp.status = 400
        else
          resp.write thing.price
        end
    else
      resp.write "Route not found"
      resp.status = 404 
    end
    resp.finish
  end

end
