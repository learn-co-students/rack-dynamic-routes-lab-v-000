class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/item/)
            # STUB do the item-related work
        else
            resp.status = 404
            resp.write "Route not found"
        end

        resp.finish
    end
end