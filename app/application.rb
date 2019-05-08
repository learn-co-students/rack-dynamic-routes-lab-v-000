require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.include?("/items/")
      search_item = req.path[7..-1]
      item_names = Item.all.collect {|item| item.name}
      if item_names.include?(search_item)
        found_item = Item.all.find {|item| item.name == search_item}
        resp.write "#{found_item.price}"
        resp.status = 200 
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
# Get substring past index three through end of string.
#last_part = value[3..-1]