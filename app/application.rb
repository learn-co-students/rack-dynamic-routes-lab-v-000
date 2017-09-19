require 'pry'
class Application
    @@items = []
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
            item_name = req.path.split(/items/).last.gsub(/[\/]/, "") 
          search = @@items.find {|item| item.name == item_name}
          
          if search == nil
              resp.write "Item not found"
              resp.status = 400
          else 
              resp.write search.price
          end
        else 
            resp.write "Route not found"
            resp.status = 404 
        end# of if statement 
        resp.finish 
    end# of call
end# of class