require 'pry'
class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
 binding.pry
    if req.path.include?("/items/")
      item_name = req.path.split("/").last
      #resp.write "#{name.price}"   
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end