require 'pry'

class Application

  @@items = Array.new

  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    item_name = request.path.split("/items/").last
    item = @@items.find{ |i| i.name == item_name }

    if request.path.match(/items/)
      if @@items.include?(item)
        response.write "#{item.price}"
      else
        response.write "Item not found."
        response.status = 400
      end
    else
      response.write "Route not found."
      response.status = 404
    end

    response.finish
  end
end
