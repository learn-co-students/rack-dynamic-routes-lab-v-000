class Application


    @@items = [Item.new("carrots", 18), Item.new("beets", 12), Item.new("ginger", 11)]


    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)

      item_term = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      if item = @@items.find{|i| i.name == item_term}

           resp.write "#{item.price}"
         else
           resp.write "Item not found"
           resp.status = 400
         end
       else
         resp.write "Route not found"
         resp.status = 404
    end
    # resp.finish
  end
end
