require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    path_req = req.path
    req_item = Item.all.find{|item| item.name == path_req.split("/")[2]}
    # i have to split the name out, identify the object by name and then return it to a variable

    if path_req.match(/items/) && req_item
      resp.write "#{req_item.price}"
    elsif path_req.match(/items/)
       resp.write "Item not found"
       resp.status = 400
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end

end
