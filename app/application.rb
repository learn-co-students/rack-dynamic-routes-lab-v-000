class Application
	@@items = []

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)
		item = req.path.split("/items/").last
		item_price = ""
		if req.path.match("/items/")
			@@items.each do|array_item|
			 	if array_item.name == item
					item_price = "#{array_item.price}"
				end
			end
			if !(item_price.empty?)
				resp.write item_price
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
