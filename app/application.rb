class Application
    
    attr_accessor :name, :price
    
    @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

    def call(env)
    
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    item_name = req.path.split("/items/").last
    
        if req.path.match("/items/")
            if item_wanted = @@items.find {|i| i.name == item_name}
                resp.write item_wanted.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end 
        resp.finish
    end
end