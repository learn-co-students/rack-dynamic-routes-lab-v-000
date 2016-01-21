class Application

	@@items = []

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)

		if req.path.match(/items/)
			req_item = req.path.split("/items/").last
			item_names = @@items.collect{|item| item.name }
			if item_names.include?(req_item)
				price = @@items.find{|item| item.name == req_item}.price
				resp.write "#{price}"
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
