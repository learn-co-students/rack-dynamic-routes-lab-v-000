class Application

@@items = []

  def call(env)
    resp  = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
       if item = @@items.find{|item| item.name == item_name}
         resp.write "#{item.price}\n"
       else
#if user requests an item that you don't have, return a 400 + error message
         resp.write "Item not found"
         resp.status = 400
       end
#if user enters any other route -> route not found
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
