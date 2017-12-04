class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    item = @@items.detect{|i| i.name == req.path.split("/").last} if @@items != []
    resource = "/items/#{item.name}" if item

    if req.path.match(/items/)
      if req.path == resource
      resp.write "#{item.price}"
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
