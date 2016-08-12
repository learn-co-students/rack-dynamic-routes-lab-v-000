class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

     #the link should return the price of the asked for item
    #if you don't have that item, return a 400 and an error message
    #if any other link is requested, send a 404 message
    if req.path.match(/items/)
       item_name = req.math.split("/item/").last
       if Item.all.include?(item_name)
        item = Item.all.find{|i| i.name == item_name}
        resp.write item.price
      else
        resp.status = 400
        resp.write "We don't have that item."
      end
     else
       resp.status = 404
    end
   end

end