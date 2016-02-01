# Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
# If a user requests /items/<Item Name> it should return the price of that item
# IF a user requests an item that you don't have, then return a 400 and an error message

class Application
  @@items

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split("/items/").last
      names = @@items.collect do |item|
        item.name
      end

      if names.include?(search_term)
        resp.write find_by_name(search_term).price
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

  def find_by_name(name)
    @@items.each do |item|
      if item.name == name
        return item
      end
    end
  end

end