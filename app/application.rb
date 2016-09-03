class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      # binding.pry
      if item_exists?(item_name)
        item = @@items.find{|i| i.name == item_name}
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

  def item_exists?(item_name)
    @@items.collect do |item|
     item.name == item_name
    end.first
  end

end