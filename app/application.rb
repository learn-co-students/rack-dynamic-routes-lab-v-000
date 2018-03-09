class Application

  @@items =[]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?"/items"
      i=req.path.split('/').last
      item = @@items.find {|item| item.name == i}
      if   item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write item.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
  resp.finish
end
end
