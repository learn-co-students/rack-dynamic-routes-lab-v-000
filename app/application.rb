class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item = @@items.find{|i| i.name == item_name}
        resp.write item.price
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


#class Application
  #@@items = []
  #def call(env)
    #resp = Rack::Response.new
    #req = Rack::Request.new(env)

    #if req.path.!match(/items/)
      #@@items.each do |item|
        #resp.write "Route not found"
        #resp.status = 404
      #end

    #elsif
      #search_term = req.params["q"]

      #if @@items.include(search_term)
        #resp.status = 200

      #else
        #resp.write "Item Not Found"
        #resp.status = 400

      #end
    #end
    #resp.finish
  #end
#end
