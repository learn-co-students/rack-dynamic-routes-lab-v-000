class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

      if req.path.match(/items/)

        req.path_info.slice!(0,7)

        item_names = @@items.collect do |item|
          item.name
        end

        if item_names.include?(req.path_info)
          @@items.each do |item|
            if item.name == req.path_info
              resp.write item.price
            end
          end
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
