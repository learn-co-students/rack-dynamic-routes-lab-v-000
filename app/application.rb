require "pry"

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/items/)
      item_name = req.path.split(/items\//).last
      find_item = @@items.select! {|item| item.name == item_name}
      if find_item == []
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{find_item[0].price}"
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
