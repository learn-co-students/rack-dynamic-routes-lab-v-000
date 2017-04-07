require 'pry'
class Application
  @@items = []
  def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        item_name = req.path.split("/items/").last
        if item =@@items.find{|i| i.name == item_name}
          resp.write item.price
        else
          resp.status = 400
          resp.write "Item not found"
        end
      else
        resp.status=404
        resp.write "Route not found"
      end
      resp.finish
    end
  # def call(env)
  #   resp = Rack::Response.new
  #   req = Rack::Request.new(env)
  #
  #   if req.path.match(/items/)
  #     item_name = req.path.split("/items/").last
  #
  #     @@items.each do |item|
  #       if item.name == item_name
  #         resp.write "This item costs #{item.price}"
  #         resp.status = 200
  #       else
  #         resp.write "Item not found"
  #         resp.status = 400
  #       end
  #     end
  #   else
  #     resp.write "Route not found"
  #     resp.status = 404
  #   end
  #   resp.finish
  # end

end
