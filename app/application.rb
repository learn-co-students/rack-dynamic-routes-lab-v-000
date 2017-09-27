require 'pry'

class Application

  #i have a @@items array of item object
  #I got a name (string) from the path
  #I need to iterate through @@items to see if any item.name == item

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      url_item = req.path.split("/").last
      match = @@items.find{|item| item.name == url_item}

        if match
          resp.write match.price
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
end