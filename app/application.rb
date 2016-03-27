require 'pry'
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last # ex. item_name = Figs
      if item = @@items.find{|i| i.name == item_name} # find returns the obj that is passed to the block for which the block returns true, or nil. 
      # set that obj eq to 'item'
        resp.write item.price
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