require 'pry'
class Application

  @@items = []

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      item = req.path.split(/items\//).last
      if i = find_item(item)
        resp.write(i.price)
      else
        resp.write('Item not found')
        resp.status = 400
      end
    else
      resp.status = 404
      resp.write('Route not found')
    end
    resp.finish
  end

  def find_item(item)
    @@items.find { |i| i.name == item }
  end

end
