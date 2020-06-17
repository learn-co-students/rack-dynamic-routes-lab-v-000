class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/items/)
        item = req.path.split("/items/").last
        if item = @@items.find{|i| i.name == item}
          resp.write item.price
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


  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
