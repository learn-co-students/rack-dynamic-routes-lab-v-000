class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.gsub("/items/", "") 

      unless item = @@items.detect { |item| item.name == item_name }
        resp.write("Item not found")
        resp.status = 400
      else
        resp.write("#{item.price}")
      end
    else
      resp.write("Route not found")
      resp.status = 404
    end

    resp.finish
  end

end