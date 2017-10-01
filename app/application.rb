class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split("/items/").last.downcase
      self.handle_search(search_term, resp)
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

  def handle_search(query, resp)
    found_item = false

    Item.items.each do |item|
      if item.name.downcase == query
        resp.write item.price
        found_item = true
      end
    end

    if found_item == false
      resp.write "Item not found"
      resp.status = 400
    end
  end
end
