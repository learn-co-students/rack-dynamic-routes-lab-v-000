class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/item/)
            if item = find_item_with_path(req.path)
                resp.write "#{item.price}"
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
    def find_item_with_path(path)
        item_name = path.split("/items/").last
        if item_name != nil
            item_name = item_name.split("+").join(" ")
            @@items.find{|item| item.name == item_name}
        else
            return nil
        end
    end
end