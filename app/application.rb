class Application

  @@items = [Item.new("Sorry", "Justin Bieber"),
            Item.new("Hello","Adele")]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last#turn /items/<Item.name> into <Item.name>
      if @@items.include?(item_name)
        item = @@items.find{|i| i.name == item_name}
        req.return "#{item.price}"
        #item = @@items.find{|s| i.name == item_name}
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
      # @@items.each do |item|
      #   resp.write "#{item.name}\n"
      # end
    end

    resp.finish
  end
end
