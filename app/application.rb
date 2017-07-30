

class Application

  @@items = []

  def self.items
    @@items
  end

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      req_item = req.path.split("/items/").last
      # binding.pry
      found_item = self.class.items.find { |item| item.name == req_item }
# binding.pry
      if found_item
        resp.status = 200
        resp.write found_item.price

        # binding.pry
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"

      # binding.pry
    end

    resp.finish
  end

end
