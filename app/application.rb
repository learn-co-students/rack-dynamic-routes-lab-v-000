class Application

  @@items = []
  @@cart = []

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items/")
      item_to_add = req.path.split("/items/").last
        i = @@items.select {|i| i.name == item_to_add}

        if !i.empty?
          resp.write(i)
        else
          resp.write("Item not found")
          resp.status = 400
        end


      # #song_title = req.path.split("/songs/").last

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish

  end
end
