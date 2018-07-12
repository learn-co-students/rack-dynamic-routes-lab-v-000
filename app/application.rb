require 'pry'

class Application
  
  attr_accessor :item
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    binding.pry
    if req.path.match(/items/)
      item_name = req.params["Item Name"]
      if @@items.include?(item_name)
        resp.write "#{item_name.price}" 
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