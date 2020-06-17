class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new    
    req = Rack::Request.new(env)

    if req.path.match(/items/)      
      item_name = req.path.split("\/items\/").last

      thingy = @@items.map do |item|
        item.name if item.name == item_name
      end.first

      if !thingy.nil?
        thingy_price = @@items.map do |item| 
          item.price if item.name == item_name
        end
        resp.write thingy_price      
      else
        resp.status = 400
        resp.write "Item not found"
      end

    else
      resp.status = 404
      resp.write "Route not found"
    end


    resp.finish
  end


end