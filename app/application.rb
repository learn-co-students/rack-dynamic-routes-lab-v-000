require 'pry'
class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_req = req.path.split("/items/").last
      @@items.each {|i| 
        if i.name == item_req
          resp.write "#{i.price}"
        end
      }
      if resp.length == 0
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