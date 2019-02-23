require 'pry'
class Application 
  
  @@items = [Item.new("Figs",3.42), Item.new("Pears", 0.99)]
  
  def call(env) 
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    item_checked = req.path.split("/").last
   if req.path== "/items/#{item_checked}"
       resp.write item_check(item_checked, resp)
    else
      resp.write "Route not found"
      resp.status = 404
    end
     resp.finish
  end
  
  def item_check(item_checked, resp)
   item = @@items.find {|item| item.name == item_checked}
     if item
       "#{item.price}"
     else
      resp.write "Item not found."
      resp.status = 400
    end
  end
  
end