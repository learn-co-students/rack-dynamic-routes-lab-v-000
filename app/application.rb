class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items/")
      item_name = req.path.split("/items/").last
      if self.class.find_item(item_name).length > 0
        resp.write self.class.find_item(item_name)[0].price.to_s
        resp.status = 200
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

  def self.items
    @@items
  end

  def self.find_item(name)
    self.items.select{ |item| item.name == name }
  end

end
