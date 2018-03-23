class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last #turn /items/carrot into carrot
      item_names = @@items.collect {|i| i.name}
      if item_names.include?(item_name)
        item_price = @@items.each {|i|
          if i.name == item_name
            resp.write "#{i.price}"
          end
          }
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
