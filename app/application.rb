class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      if Item.all.find{|i| i.name == item}
        Item.all.each do |item|
          resp.write "#{item.price}"
          resp.status = 200 #The request is OK
        end
      else resp.write "Item not found"
        resp.status = 400 #The server did not understand the request
      end
    else resp.write "Route not found"
      resp.status = 404 #The server can not find the requested page
    end
    resp.finish
  end
end
