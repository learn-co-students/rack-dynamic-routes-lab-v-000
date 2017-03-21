class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    body = ""

    #binding.pry
    if /\A\/items\/[^\/]+\Z/.match(req.path)
      req_item = req.path.split("items/").last
      found_item = @@items.find { |item| item.name == req_item }
      if found_item 
        body = "The price of #{found_item.name} is $#{found_item.price}"
        resp.status = 200
      else
        body = "Sorry, Item not found"
        resp.status = 400
      end
    else
      body = "Error, Route not found"
      resp.status = 404
    end
    resp.write body
    resp.finish
  end
  
end
