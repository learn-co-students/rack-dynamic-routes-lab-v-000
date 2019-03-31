class Application
  #@@items = []
  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)] # For web testing purposes

  def call(env)
    resp = Rack::Response.new # Instance of the HTTP response
    req = Rack::Request.new(env) # Instance of the HTTP request
    # Requests have a `path` which is basically whatever is after the url

    if req.path.match(/items/) # checks if path has items in it :ie localhost:9292/items/Apples
      item_name = req.path.split("/items/").last # splits the path to get whatever is after /items/ ie: `Apples`
      item = @@items.find{|i| i.name == item_name} # tries to find said item in a the items list
      if item #Returns item price if it is in @@item. If the item is not nil
        resp.write item.price
      else #Returns an error and status of 400 if the item is not there
        resp.write "Item not found"
        resp.status = 400
      end
    else # Returns 404 for a bad route
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
