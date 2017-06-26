class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write item.price
      end

    elsif
      resp.write "Route not found"
      resp.status = 404

    else
      resp.write "Item not found"
      resp.status = 400
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
