class Application
  @@items =[]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !req.path.match(/item/)
      resp.write "Route not found"
      resp.status = 404
    else
      item_name = req.path.split("/items/").last

      if item = @@items.find{|i| i.name == item_name}
        resp.write "#{item.price}\n"

      else
        resp.write "Item not found"
        resp.status = 400
      end
    end
    resp.finish


    # if req.path.match(/item/)
    #   item_name = req.path.split("/item/").last
    #
    #   if item = @@items.find{|i| i.name = item_name}
    #     resp.write "#{item.price}\n"
    #   else
    #     resp.write "Item not found"
    #     resp.status = 400
    #   end
    # else
    #   resp.write "Route not found"
    #   resp.status = 404
    # end
  end
end
