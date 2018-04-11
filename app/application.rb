
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_query = req.path.split("/items/").last
      if @@items.any?{|i| i.name == item_query}
        resp.write @@items.find{|i| i.name == item_query}.price
        resp.status = 200
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
