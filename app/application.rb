class Application

	@@items = []

	def call(env)

		resp = Rack::Response.new
		req = Rack::Request.new(env)

		
		if req.path.match(/items/)
			item_req = req.path.split("/items/").last
			#if @@items.include?(item_req)
			item = @@items.find{|i| i.name == item_req}
				if item != nil
				resp.write item.price
				resp.status = 200
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
