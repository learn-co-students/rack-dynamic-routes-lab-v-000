class Application

	@@items = []
	@@cart = []

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)

		if req.path.match(/items/)
			item_name = req.path.split("/").last
			match = @@items.find {|item|item.name == item_name}
			if match.nil?
				resp.write "Item not found"
				resp.status = 400
			else
				resp.write match.price
			end
		else
			resp.write "Route not found"
			resp.status = 404
		end

		resp.finish
	end

end