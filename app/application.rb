class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      #resp.write req.path.split("/items/").last
      fruit = req.path.split("/items/").last
      found = @@items.detect do |item|
        item.name==fruit
      end

      if found == nil
        resp.status = 400
        resp.write "Item not found"
      else
        resp.write "#{found.name} is $#{found.price}"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish

  end
end
