require 'pry'
class Application

  @@items = [Item.new('Pears', 0.99), Item.new('Figs', 3.42)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_name = req.path.split('/items/').last
      if item = @@items.find{|i| i.name == item_name}
        resp.write item.price
#binding.pry      
      else
        resp.status = 400
        resp.write "Item not found"
     end
    else
      resp.status = 404
      resp.write "Route not found"
   end
   resp.finish
 end
end
