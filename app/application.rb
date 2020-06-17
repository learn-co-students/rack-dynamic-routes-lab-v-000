class Application
  @@items = []
  
  def call(env)
    response = Rack::Response.new
    request  = Rack::Request.new(env)
    
    if request.path.match(/items/)
      wanted_item = request.path.split('/items/').last
      item = @@items.find { |i| i.name == wanted_item }
      
      unless item.nil?
        response.write item.price
      else
        response.write "Item not found"
        response.status = 400
      end
    else
      response.write "Route not found"
      response.status = 404
    end

    response.finish
  end
end