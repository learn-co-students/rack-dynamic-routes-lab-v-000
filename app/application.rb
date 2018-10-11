require 'pry'

class Application
@@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/) #if is is a good path:
      #binding.pry
      user_selected_item = req.path.split("/items/").last #set item to figs  #if @@items.include?(item) && ...
      if user_selected_item = @@items.find{|i| i.name == user_selected_item} #if this user_selected_item is found in the @@items array, then return the item name and price
        resp.write  "#{user_selected_item.price}"
        resp.status = 200
      else #if not in the array, give error message
        resp.write "Item not found"
        resp.status = 400
      end
    else #else, the route is bad and return 404
      resp.write "Route not found" #else it is not a
      resp.status = 404
    end
    resp.finish
  end

end
