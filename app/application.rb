require 'pry'
class Application

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.include? ("/items/")

      search_item=req.path.split("items/").last
      found_item=@@items.select {|item| item.name==search_item}
      
      if found_item != []
      resp.write "The price of the #{search_item} is #{found_item[0].price}"
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
