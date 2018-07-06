require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      search_term = req.path.split("items/")[1]

       item = @@items.detect do |item|
         item.name == search_term
       end
        if item != nil
          resp.write "#{item.price}"
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
end
