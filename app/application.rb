class Application
  def call(env)
    resp = Rack::Response.new
    req  = Rack::Request.new(env)

    if req.path.match(/items/)
      item = Item.all.detect { |item| item.name == req.path.split('/items/').last }
      
      if item
        resp.status = 200
        resp.write "#{item.name}\n#{item.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end

    else
      resp.status = 404
      resp.write "404 Route not found"
    end

    resp.finish
  end
end
