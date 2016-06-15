class Application

@@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_title = req.path.split("/items/").last

      # item = @@items.find{|s| s.name == item_title}
        if @@items.find{|s| s.name == item_title} 
            
            # item1 = @@item.find{|s| s.name == item_title}
            resp.write "#{@@items.find{|s| s.name == item_title}.price}"
         
            # resp.write "#{item1.price}"
        else
          resp.status = 400
          resp.write "Item not found"
        end 

    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end

end 