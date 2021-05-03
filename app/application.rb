require 'pry'

class Application

  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # if req.path.match(/testing/)
    # if req.path=="/testing"

    if req.path.match(/items/) 
      item_name = req.path.split("/items/").last
      found_item = @@items.find do |item|
         item.name == item_name
        end
        if found_item
          resp.write found_item.price
        else
          resp.write "Item not found"
          resp.status  = 400
        end
        # binding.pry  
    else 
    # !@@item.include?(@@item.last)
    resp.write "Route not found"
    resp.status = 404
    end
    resp.finish
  end
end

# elsif req.path.match(/items/)
#     search_term = req.params["item"]
#      if @@item.include?(search_term)
#        @@item.each do |item|
#          resp.write "#{item}\n"
#          end
#       else
#   # elsif @@item.include?(@@item.last)
#         resp.write "Item not found"
#         resp.status = 404
#       end
#   end

# elsif req.path.match(/items/)
    #   if @@item.include?(@@item.last)
    #     @@item.each do |item|
    #       resp.write "#{item}\n"
    #     end
    #   else 
    #     # !@@item.include?(@@item.last)
    #     resp.write "Item not found"
    #     resp.status = 404
    #   end