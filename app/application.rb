require_relative './item.rb'
require 'pry'


class Application
@@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    item_available = false

    if req.path.match(/items/)
      item_requested = req.path.split("/items/").last
      @@items.each do |item|
        if item.name == item_requested
          resp.write "#{item.price}"
          item_available = true
        end
      end
        if item_available == false
          resp.status = 400
          resp.write "Item not found"
        end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end