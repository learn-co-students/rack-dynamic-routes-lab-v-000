require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req  = Rack::Request.new(env)


    if req.path.match(/items/)
      items = Item.all
      item_name = req.path.split("/items/").last
      searched_item = Item.find_by(item_name)

      if items.include?(searched_item)
        resp.write "#{searched_item.price}\n"
        resp.status = 200
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
