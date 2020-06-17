class Application

	@@items = []

	def call(env)
		res = Rack::Response.new
		req = Rack::Request.new(env)

		if req.path.match(/items/)
			item_name = req.path.split("/items/").last
			item = @@items.find {|i| i.name==item_name}
			if item
				res.write "#{item.price}"
			else
				res.status = 400
				res.write "Item not found"
			end
		else
			res.status=404
			res.write "Route not found"
		end
		res.finish
	end
	
end