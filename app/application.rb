require 'pry'
class Application

  def call(env)

    resp =  Rack::Response.new
    req  =  Rack::Request.new(env)
    param = req.path
    


    if( param.match("/items/")) 
        # if our path has items in it we will do the following

        item_requested = Item.all.find{|item| param.split("/").last == item.name}
        #where item_requested will have a matched item from Item class

        if(item_requested) 
         resp.write (item_requested.price)
        else
          resp.write("Item not found")
          resp.status = 400
        end

  else
      resp.status = 404
    resp.write ("Route not found")
    end

resp.finish
 
  end
end

# class Application
#  
#    def call(env)
#      resp = Rack::Response.new
#      req = Rack::Request.new(env)
#  
#      unless req.path.match(/items/)
#        resp.write "Route not found"
#        resp.status = 404
#      end
#  
#      if req.path.match(/items/)
#        item_name = req.path.split("/items/").last  #/items/item_name => "item_name"
#        item = @@items.find {|item| item.name == item_name} #item = object in @@items with .name property that matches item_name. @@items in spec.
#        if item
#         resp.write "#{item.price}" #{} not needed but makes it more obvious.
#        else
#          resp.write "Item not found"
#          resp.status = 400
#        end
#      end
#     resp.finish
#    end
#  end