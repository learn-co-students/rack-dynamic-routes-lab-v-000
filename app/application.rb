require 'pry'


class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

        item_name = req.path.split("/items/").last
        return_value = @@items.find{|i| i.name == item_name}
        
        if return_value != nil
        resp.write "#{return_value.name}, #{return_value.price}"
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
