class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)      
      item_name = req.path.split("/items/").last
      item = @@items.detect do |item|
      item.name==item_name
      end

      if item == nil
        resp.status = 400
        resp.write "Item not found"
      else
        resp.write "#{item.name} is $#{item.price}"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish

  end
end