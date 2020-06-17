class Application
  @@items = [Item.new("apple",350)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      if exists = @@items.detect{|a| a.name==item}
        resp.write "#{exists.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "404'd! Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
