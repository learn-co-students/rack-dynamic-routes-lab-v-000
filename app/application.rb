require_relative '../config/environment'

class Application
  @@itrems = [Item.new("Baklawah", "$32:34"), Item.new("Sushi", "$15.99"), Item.new("Knegelachk", "$12.99")]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item =@@items.find{|x| x.name == item_name}
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status=404
      resp.write "Route not found"
    end
    resp.finish
  end
end
