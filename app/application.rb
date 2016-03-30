require 'pry'
class Application
  def call(env)


    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}  #this to change to calling the class
      if item
        resp.write item.price
      else
        resp.write "Item not found" #also need this up there
        resp.status = 400
      end
    else
      resp.write "Route not found" #also need this up there
      resp.status = 404
    end

    resp.finish
  end
end