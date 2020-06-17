class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      #make sure URL is right, and assign the item they requested to variable
      item = req.path.split("/items/").last
      #check variable name against existing item DB and return price
      if item = @@items.find{|x| x.name == item}
        resp.write item.price
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
