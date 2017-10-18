
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      add_item = req.path.split('/items/').last
      if @@items.any?{|i| i.name == add_item}
        resp.status = 200
        return_item = @@items.find{|i| i.name == add_item}
        resp.write "#{return_item.price}"
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

end  # End of Class
