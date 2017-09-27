class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.params["item"]
        if @@items.include?("items/#{search_term}")
          # @@cart << search_term
          resp.write "#{item.price}"
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
