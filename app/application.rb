class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    Item.new("Figs",3.42)
    Item.new("Pears",0.99)

    if req.path.match "/items/"
      item_name = req.path.split("/items/").last
      puts item_name

      item = Item.find_by_name(item_name)
      if item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "This item is $#{item.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end