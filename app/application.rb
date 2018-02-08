class Application
@@items = [] #spec fills these
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path == "/items"
      name = req.path.split("/items/").last

        if @@items.find{|element| element.name == name}
          item = @@items.find{|element| element.name == name}
          resp.write item.price
        else
          resp.write "Item not found"
          resp.status = 400
        end


    else
      resp.write "Route not found"
      resp.status = 404

    end


  resp.finish
  end
end
