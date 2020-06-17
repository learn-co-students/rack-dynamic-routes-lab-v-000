class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item_index = nil
      if Item.all.detect.with_index{|i, index| i.name == item_name ? item_index = index : nil}
        resp.write Item.all[item_index].price
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
