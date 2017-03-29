require "pry"
class Application

 @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_title = req.path.split("/items/").last
      if @@items.any?{|i| i.name == item_title}
        price = nil
        @@items.each do |i|
          price = i.price if i.name == item_title
        end
        resp.write "#{price}"
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
