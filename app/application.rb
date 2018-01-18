require 'pry'

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

     if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      if find_item(item_name)
        resp.write find_item(item_name)
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    def find_item(item_name)
      item = @@items.find {|item| item.name == item_name }
      if item
        item.price
      end
    end

    resp.finish
  end
end
