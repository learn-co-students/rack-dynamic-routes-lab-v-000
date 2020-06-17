require_relative 'item.rb'
class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split("/").last
      result = ""
      resp.write "search term is: #{search_term}\n"
      resp.write "@@items = #{@@items}"
      @@items.each do |item|
        resp.write "within loop\n"
        if item.name == search_term
          resp.write "item name: #{item.name}\n"
          result = item.price
        end
      end

      if result == ""
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{result}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
