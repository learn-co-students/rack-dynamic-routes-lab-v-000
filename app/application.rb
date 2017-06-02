class Application

  @@items = [] #Not sure if this line is necessary in this case because the test directly sets the class variable

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_to_search = req.path.split("/items/").last
      if item = @@items.find{ |item| item.name == item_to_search }
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