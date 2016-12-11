class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item_name = @@items.find{|i| i.name == item_name}
        resp.write item_name.price
      else
        resp.status = 400
        # #status ⇒ Object
        # Returns the value of attribute status
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

end
