require 'pry'
class Application

@@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
  if req.path != "/items/"
    resp.write "Route not found"
    resp.status = 404
  elsif req.path== "/items/" && @@items.find{|x| x.name == (req.path.split("/items/").last)}
    item = req.path.split("/items/").last
    item_price = @@items.find{|x| x.name == item}
    resp.write item_price.price
  else
    resp.write "Item not found"
    resp.status = 400
  end

  resp.finish
end




end
#&& @@items.find{|x| x.name == (req.path.split("/items/").last)}