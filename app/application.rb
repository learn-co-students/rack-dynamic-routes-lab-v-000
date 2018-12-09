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
      resp.write "#{item.price}"   
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end