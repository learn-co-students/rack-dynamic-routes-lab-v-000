class Application

    @@item = ["3.42"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # if req.path.match(/testing/)
    if req.path=="/testing"
      resp.write "Route not found"
      resp.status = 404
    elsif req.path.match(/items/)
      @@item.each do |item|
        resp.write "#{item}\n"
      end
    # else
    #   search_term = req.params["item"]
    #   @@items.!inlcude?(item)
    #     resp.write "Item not found"
    #     resp.status = 404
       
    end
    resp.finish

  end
end