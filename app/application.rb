require "pry"
class Application

  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      requested_item = req.path.split(/items\//).last
      #binding.pry
      item_object = @@items.find do |item|
        item.name == requested_item
      end

      if item_object.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "The price is:#{item_object.price}"
      end

    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
