class Application

  @@item = ["3.42"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/testing/)
    # if req.path=="/testing"
      resp.write "Route not found"
      resp.status = 404
    elsif req.path.match(/items/)
      @@item.each do |item|
        resp.write "#{item}\n"
      end
    elsif !@@item.include?(@@item.last)
    resp.write "Item not found"
    resp.status = 400
    end
    resp.finish
  end
end

# elsif req.path.match(/items/)
#     search_term = req.params["item"]
#      if @@item.include?(search_term)
#        @@item.each do |item|
#          resp.write "#{item}\n"
#          end
#       else
#   # elsif @@item.include?(@@item.last)
#         resp.write "Item not found"
#         resp.status = 404
#       end
#   end

# elsif req.path.match(/items/)
    #   if @@item.include?(@@item.last)
    #     @@item.each do |item|
    #       resp.write "#{item}\n"
    #     end
    #   else 
    #     # !@@item.include?(@@item.last)
    #     resp.write "Item not found"
    #     resp.status = 404
    #   end