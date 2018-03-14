class Application
  @@item = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      the_path = req.path.split('/').last

      found = false
      @@item.each do |item|
        if item.name == the_path
          found = true
          resp.write "#{item.name} costs #{item.price}"
        end
        if found == false
          resp.write "Item not found"
          resp.status = 400
        end
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
