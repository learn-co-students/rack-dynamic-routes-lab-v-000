class Application

  @@items = []

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|x| x.name == item_name}
      
      # @@all.each do |item|
      #   if @@all.include?(item)
      #     resp.write Item.price
        if item
          resp.write "#{item.price.to_s}"
        else
          resp.status = 400
          resp.write "Item not found"
          
        end
      
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish 
  end #end def call






end #ends Class