class Application

  @@items = []#[Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/items/)
      # req.path=="/items/<ITEM NAME>"
      item_name = req.path.split("/items/").last
      item = @@items.detect {|item| item.name == item_name}
        if item != nil
          resp.write item.price
        # @@items.incldues?(item) #Why does 'includes?' not work???
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
  end
end
