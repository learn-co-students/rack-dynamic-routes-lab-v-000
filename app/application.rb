require 'pry'
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
# binding.pry
    if req.path.match(/items/)
      q = req.path.split("/items/").last
      result = @@items.detect {|item| item.name == q}
      if result
        resp.write "#{result.price}"
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
