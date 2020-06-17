class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.detect{|x| x.name == item_name}
      if item 
        resp.write "#{item.price.to_s}"
      else
        resp.status = 400
        resp.write "Item not found"  
      end
    else
      resp.status = 404
      resp.write "Route not found"     
    end

    resp.finish
  end
end ## class end