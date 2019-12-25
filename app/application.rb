class Application

  @@items = [Item.new("Mac", 142), Item.new("iPhone", 423)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/) #/items/Figs
      item_name = req.path.split("/items/").last #Figs
      if item = @@items.find{|i| i.name == item_name}
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


#run rackup config.ru to test.
#visit on chrome: localhost:9292

#localhost:9292
  #Route note found

#localhost:9292/items
  #Item not found

#localhost:9292/items/Mac
  #142
