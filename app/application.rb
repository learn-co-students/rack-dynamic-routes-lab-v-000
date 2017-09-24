class Application

  @@items = []

  def call(env)
    req  = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      item_req = req.path.split(/\//).last

      @@items.find(-> {"#{resp.status = 400}, #{resp.write 'Item not found'}"}) do |obj|
        resp.write obj.name == item_req ? "#{obj.price} " : nil
      end
    else
      resp.status = 404
      resp.write("Route not found")
    end
    resp.finish
   end

end
