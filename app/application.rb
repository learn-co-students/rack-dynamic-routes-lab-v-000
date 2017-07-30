class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split(/\/.+\//)[1]
      @@items.each do |item_object|
        if item_object.name == item
          resp.write("#{item_object.price}")
          resp.status = 200
        end
      end
      if @@items.none? {|item_object| item_object.name == item}
        resp.write("Item not found")
        resp.status = 400
      end
    else
      resp.write("Route not found")
      resp.status = 404
    end

    resp.finish
  end
end