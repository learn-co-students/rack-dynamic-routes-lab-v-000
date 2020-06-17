class Application
  @@items = [
    Item.new("Figs",3.42),
    Item.new("Pears",0.99)
  ]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      
      item ? resp.write(item.price) : set_response(resp, 400, "Item not found")
    else
      set_response(resp, 404, "Route not found")
    end
    resp.finish
  end

  private

  def set_response(resp, status_code, error_message)
    resp.status = status_code
    resp.write error_message
  end
end
