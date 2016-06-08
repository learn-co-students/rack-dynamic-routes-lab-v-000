require 'pry'
class Application


def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
  if req.path.match(/items/)
    item = req.path.split("/items/").last
    item_price = @@items.find{|x| x.name == item}
    resp.write item_price.price
  else
    resp.write "Route not found"
    resp.status = 404
  end
end




end