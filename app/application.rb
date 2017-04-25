require 'pry'

class Application

  @@items = []

  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    if request.path.match(/items/)
      item_name = request.path.split("/items/").last
      if item =@@items.find{|i| i.name == item_name}
        response.write item.price
      else
        response.status = 400
        response.write "Item not found"
      end
    else
      response.status = 404
      response.write "Route not found"
    end

    response.finish
  end

  def item_in_stock(requested_item)
    @@items.find {|item| item.name = requested_item}
  end

end