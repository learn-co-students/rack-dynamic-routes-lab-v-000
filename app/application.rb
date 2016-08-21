require "pry"
class Application
  @@items =[]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_title = req.path.split("/items/").last
      if item = @@items.find{ |i| i.name == item_title }
        resp.write item.price # --Returns item price if it is in @@item
      else
        resp.status = 400 # --Returns an error and 400 if the item is not there
        resp.write "Item not found"
      end

    else
      resp.status = 404 # --Returns 404 for a bad route
      resp.write "Route not found"

    end
    resp.finish
  end


end
