require 'pry'
class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.include?("/items/")
      item_name = req.path.split("/").last
  
      item = Item.all.detect do |item| 
        item.name == item_name 
      end
      if item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{item.price}" 
      end
  
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end