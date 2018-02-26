require 'pry'
class Application
  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    #binding.pry

    if req.path.match("/items/") != nil
      product = req.path.split("/")[2]
      #binding.pry

      all_items = Item.all
      selected = all_items.detect{|i|
                    i.name == product
                  }
      if selected == nil
        resp.write "Item not found"
        resp.status = 400
      else
        selected = selected.price
        resp.write "#{selected}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
