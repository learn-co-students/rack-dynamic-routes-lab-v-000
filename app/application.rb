require 'pry'

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

  # this is a bit more elegant:
  # if req.path.match(/items/)
  #   item_name = req.path.split("/items/").last
  #   if item =@@items.find{|i| i.name == item_name}
  #     resp.write item.price
    if req.path.match(/items/) != nil
      req_item = req.path.match(/(?<=items\/).*/).to_s
      found_item = @@items.select {|i| i.name == req_item}
      if found_item.empty?
        resp.write "Item not found"
        resp.status = 400
      elsif found_item[0].price != nil
        resp.write "#{found_item[0].price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
