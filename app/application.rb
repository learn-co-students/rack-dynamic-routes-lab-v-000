class Application

  attr_accessor :name, :price
  @@items =[]


  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      input = req.path.split("/items/").last
      counter = 0
      @@items.each do |item|
        if item.name == input
          resp.write "#{item} #{item.price}"
        else
          counter = counter+1
        end
        if counter == @@items.length
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
