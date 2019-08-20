class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/\/items\/(\w+)/)
      found_item = @@items.detect {|item| item.name == $1} #$1 returns 1st match group from last regex
      if found_item
        resp.write found_item.price
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