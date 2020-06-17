class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new     #rack setup
    req = Rack::Request.new(env)  #rack setup
    if req.path.match("/items")   #if the client request includes items
          item_name = req.path.split("/items/").last
          #regex turning /items/apple into "apple" so we can isolate what the unqiue identfier in the path is (source??)
          item = @@items.find{|i| i.name == item_name}
          #create a variable that is set to enumerate over the array searching for where the element of the array matches the parsed user request
          # i.name interacts with the item.rb file that has a class for item that has name and price
          if item.nil?   #if item does not yield anything
            resp.write "Item not found"
            resp.status = 400   #specific code for your search not yielding anything
          else
            resp.write item.price
            # i.name interacts with the item.rb file that has a class for item that has name and price
          end
    else
          resp.write "Route not found"
          resp.status = 404  #specific code for the route not being correct to find a page
    end
    resp.finish  #standard protocal to end rack
end
end


#to see code enter the following in terminal "rackup config.ru"
