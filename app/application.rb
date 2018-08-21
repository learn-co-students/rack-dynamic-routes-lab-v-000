
class Application

  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/item")
      item = req.path.split("/item/").last
      if @@items.include?(item)
        resp.write item.price
      end 
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end


end
