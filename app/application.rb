require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      m = Item.all.select{|i| i.name == req.path.split("/items/").last}
      # binding.pry
      if m.empty?
        resp.write "Item not found"
        resp.status  = 400
      else
        resp.write "#{m.first.price}"
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
