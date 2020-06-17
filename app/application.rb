class Application

  @@items = [
    Item.new("Figs",3.42),
    Item.new("Pears",0.99)
  ]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      individual_item = req.path.split("/items/").last
      if @@items.find {|item| item.name == individual_item}
        item = @@items.find {|item| item.name == individual_item}
        resp.write "Your item is #{individual_item} priced #{item.price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400


      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
resp.finish


  end ###END METHOD
end   ###END CLASS
