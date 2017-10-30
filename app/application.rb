class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.include?("/items/")
      @@items.each do |item|
        if item.name == req.path.split("/items/").last
          @item = item
        end
      end
      if @item
        resp.status = 200
        resp.write "#{@item.price}"
      else
        resp.status = 400; resp.write("Item not found")
      end
      binding.pry
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish

  end
end
