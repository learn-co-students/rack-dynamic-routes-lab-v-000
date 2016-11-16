class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      selection = req.path.split("/items/").last
      selected_item = @@items.find{|i| i.name == selection}
      if selected_item 
        resp.write selected_item.price
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