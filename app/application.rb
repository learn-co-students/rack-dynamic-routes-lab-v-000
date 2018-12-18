class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match (/testing/)
      @@items.each do |item|
        resp.write 

  end

end
