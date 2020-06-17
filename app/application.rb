class Application
  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

  if req.path.match(/items/)

    item_to_check = req.path.split("/items/").last

    if item = @@items.find{|x| x.name == item_to_check}
        resp.write item.price

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
