class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    #used for checking path
    rq = Rack::Request.new(env)


    if rq.path.match(/items/)
      item_name = rq.path.split('/items/').last
      found_item = @@items.select{|s| s.name == item_name}
      if found_item.length>0
        resp.write found_item.first.price
      else
        resp.write 'Item not found'
        resp.status = 400
      end
    else
      resp.write 'Route not found'
      resp.status = 404
    end

    resp.finish
  end
end
