require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      selected_item = @@items.find {|i| i.name == req.path[7..-1]}
      if @@items.include?(selected_item)
        resp.write selected_item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
      # binding.pry
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
    # binding.pry
  end
end
