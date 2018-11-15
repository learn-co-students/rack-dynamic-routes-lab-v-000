require 'pry'

class Application

  @@items = Array.new

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)




    if req.path.split("/")[1]=="items"
      item_requested = req.path.split("/items/").last

      item = @@items.find {|item| item.name == item_requested}
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
