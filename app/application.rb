class Application

  @@items = []
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      @@items.each do |i|
        if i.name == item
          resp.write "#{i.name}, #{i.price}\n"
          resp.status = 200
        else 
          resp.write "Item not found\n"
          resp.status = 400
        end
      end
    else
      resp.write "Route not found\n"
      resp.status = 404
    end
    resp.finish
  end

end
