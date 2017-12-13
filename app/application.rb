# require 'pry'
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
# 
    if !req.path.match(/items/)
      resp.write "Route not found"
      resp.status = 404
 
     
    elsif req.path.match(/items/)   
      item = req.path.split("/items/").last
      # binding.pry
      found_item = @@items.find{|i| i.name == item} 
      if found_item
        resp.write found_item.price.to_s
        resp.status = 200 
      else
        resp.write "Item not found"
        resp.status = 400 
      end   
    end
    resp.finish
  end
end