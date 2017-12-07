
class Application

  @@items = []

    def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items/")
      item = req.path.split("/items/").last
      f_item = found_item(item)
      if f_item
        resp.write "Price for #{f_item.name} is #{f_item.price}"
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

  def found_item(item)
    @@items.each do |i|
      if item == i.name
        return i
      end
    end
    return nil
  end

end
