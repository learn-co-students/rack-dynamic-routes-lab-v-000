require 'pry'
class Application



  def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

        if req.path.match(/items/)
         item = req.path.split(/items/).last
         item[0] = ""
          if @@items.detect{|f| f.name == item} != nil
            matched_item = @@items.detect{|f| f.name == item}
            resp.write "#{matched_item.price}"
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
