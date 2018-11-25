class Application

  @@items=[]

  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split("/items/").last
      item_finder = @@items.find {|i| i.name==search_term}

      if item_finder.nil?
        resp.write "Item not found"
        resp.status =400
      else
        resp.write "#{item_finder.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
