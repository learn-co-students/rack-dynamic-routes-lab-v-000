class Application

  @@items = []

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new
    #if request is matched to /items/<item_name>, respond...
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last #name within path
      item = @@items.find{|i| i.name == item_name } #find name from path within class array
      if @@items.include?(item)#item class contains <item_name>
        # resp.status = 200 #this is automatic
        resp.write item.price
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
