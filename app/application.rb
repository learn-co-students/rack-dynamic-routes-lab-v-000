class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

#/items/Fig
    if req.path.match(/items/)
      name_of_item = req.path.split("/items/").last
        if item = @@items.find {|i| i.name == name_of_item}
          resp.write item.price
        else
          resp.write "Item not found"
          resp.status = 400
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end


#/items/<ITEM NAME>
# else 404

#/items/<Item Name>
  #returns price
  #if dont have 400, error
