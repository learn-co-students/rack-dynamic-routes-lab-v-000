class Application

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/items/"
      resp.write "You requested the items."
    elsif req.path.match(/items/)

      item_name = req.path.split('/items/').last
      the_item = @@items.detect{|i| i.name == item_name}
      if !!the_item
        binding.pry
        resp.write the_item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write("Route not found")
      resp.status = 404
    end
    resp.finish
  end

end
