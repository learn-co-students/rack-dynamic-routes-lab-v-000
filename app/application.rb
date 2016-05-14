require 'pry'
class Application
  # @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
  @@item = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    #binding.pry
    if req.path.match(/items/)
      name = req.path.split("/items/").last
      item = @@items.find{|s| s.name == name}
      
      #binding.pry
      if @@items.include?(item)
        resp.write "#{item.price}"
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



# RETURN 404 FOR A BAD ROUTE
# RETURN ITEM PRICE IF IN @@ITEM
# RETURN ERROR 400 IF ITEM NOT IN @@ITEM
#GOOD ROUTE





      # name = req.path.split("/items/").last
      # price = @@item.find{|s| s.price == name}
      # resp.write "#{price}"