

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path_info.split("/items/").last
      get_item_info(search_term, resp)
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

  def get_item_info(search_term, resp)
    item = Item.all.find { |item| item.name == search_term }
    if item != nil
      resp.write "The price of #{item.name} is #{item.price}"
      resp.status = 200
    else
      resp.write "Item not found"
      resp.status = 400
    end
  end


end
