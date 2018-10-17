class Application

  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    item_name = request.path.split("/items/").last
    item = Item.items.find {|item| item.name == item_name}


    if request.path.match("/items/#{item_name}")
      if item.nil?
        response.status = 400
        response.write "Item not found"
      else
      response.write item.price
      end
    else
      response.status = 404
      response.write "Route not found"
    end

    response.finish

  end

end
