require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      if get_price(item) != nil
        resp.write "#{get_price(item)}"
      else
        resp.status = 400
        resp.write "Item not found"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  def get_price(item)
    item = @@items.collect {|x|
      if x.name == item
        x.price
      end
    }.compact[0]
  end

end
