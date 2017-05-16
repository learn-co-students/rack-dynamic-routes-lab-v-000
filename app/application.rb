class Application

  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/\bitems\b/)
      sought_item = req.path.split("/items/").last
      item = @@items.detect{|item| item.name == sought_item}
      if item
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

# In this lab we are asked to make the application only accept requests which strictly are prepended by `/items/`, else it should 404. When I rackup, `http://localhost:9292/item/` does not
