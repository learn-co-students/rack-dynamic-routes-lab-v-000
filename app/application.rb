class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items\/(\w+)/)
      itemname = $1
      resp.write "#{item = $1}"

      item_price_search = @@items.detect do |looking_for_my_item|
        looking_for_my_item.name == itemname
      end


      if item_price_search
        resp.write item_price_search.price
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
