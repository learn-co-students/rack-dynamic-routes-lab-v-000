class Application
  @@items = Item.all

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
        @@items.each do |item|
        if @@items.include?(item) 
          resp.write "#{item.price}"
        else
           resp.write "Item not found"
           resp.status = 400
         end 
      end 
            else
             resp.write "Route not found"
             resp.status = 404
    end
    resp.finish
end
end 
