require 'pry'
class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split("/items/").last
      item = @@items.find{|i| i.name == search_term}
      # item !nil ? resp.write "#{item.price}" : resp.status = 404
      if item == nil
        resp.status = 400
        resp.write "Item not found"
      else 
        resp.write "#{item.price}"
      end
    else 
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end