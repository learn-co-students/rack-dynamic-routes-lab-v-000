require 'pry'
class Application

  #@@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !req.path.match("/items/")
      resp.status = 404
      resp.write "Route not found"
    elsif req.path.match("/items/")
      req.path.match("/items/")
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      resp.write "#{item.price}"
      #[Item.new("Figs",3.42),Item.new("Pears",0.99)])
    end #if statement

  end #call method
end
