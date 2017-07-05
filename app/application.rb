class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.include?("/items/")
      item = req.path.gsub("/items/", "")
      searched_item = Item.items.select{|i| i.name == item}.first
      if searched_item
        resp.write "#{searched_item.price}"
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
