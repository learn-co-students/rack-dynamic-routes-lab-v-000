
class Application

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items")
      wanted_item = []
      cart_item = req.path.split("/items/").last
      Item.items.each do |each_item|
        if each_item[0] == cart_item
          wanted_item << each_item[1]
        end
      end
      if wanted_item.size > 0
        resp.write wanted_item[0]
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
