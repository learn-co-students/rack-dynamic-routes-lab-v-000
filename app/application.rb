
class Application

  @@items ={}

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last.gsub(/\/items\//, "")
      if found_item =@@items.find{|i| i.name == item_name}
        resp.write "#{found_item.name},#{found_item.price}"
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
  






  #   if req.path.match(/items/)
  #     @@items.each do |item|
  #       resp.write "#{item}\n"
  #     end
  #   elsif req.path.match(/search/)
  #     search_term = req.params["q"]
  #     resp.write handle_search(search_term)
  #   elsif req.path.match(/cart/)
  #     if @@cart.empty? 
  #       resp.write "Your cart is empty"
  #     else
  #       @@cart.each do |i|
  #       resp.write "#{i}\n"
  #       end
  #     end
  #   elsif req.path.match(/add/)
  #     item = req.params["item"]
  #     if @@items.include? item
  #       @@cart << item
  #       resp.write "added #{item}"
  #     else
  #       resp.write "We don't have that item!"
  #     end
  #   else
  #     resp.write "Path Not Found"
  #   end

  #   resp.finish
  # end

  # def handle_search(search_term)
  #   if @@items.include?(search_term)
  #     return "#{search_term} is one of our items"
  #   else
  #     return "Couldn't find #{search_term}"
  #   end
  # end

end