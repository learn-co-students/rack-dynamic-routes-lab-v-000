class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      #set 'item_name' equal to the name string, such as Figs
      item_name = req.path.split("/items/").last
      #set 'item' equal to the instance whose name matches the string
      #otherwise, the #detect will set 'item' equal to 'nil'
      item = @@items.detect {|item| item.name == item_name}
      if item != nil   
        resp.write item.price
        resp.status = 200
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