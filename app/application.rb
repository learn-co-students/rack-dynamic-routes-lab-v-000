require_relative "item"
class Application
  Item.new("Figs",3.42)
  Item.new("Pears",0.99)
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = Item.all.find{|i| i.name == req.path.split("/items/").last}
      if !item.nil?
        resp.write item.price
        resp.status = 200
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
