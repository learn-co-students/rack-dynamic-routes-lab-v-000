class Application 

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

  search_term = "items/#{req.params["q"]}"

  if req.path.match(/items/)
    item_name = req.path.split("/items/").last
    item = @@items.find { |i| i.name == item_name} # finds the item in all
      if @@items.include?(item) == false 
        resp.write "Item not found"
        resp.status = 400 
      elsif @@items.include?(item) == true
        resp.write item.price 
        resp.status = 200 
      end
  else
    resp.write "Route not found"
    resp.status = 404
  end
  resp.finish 
  end



end


# Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
# If a user requests /items/<Item Name> it should return the price of that item
# IF a user requests an item that you don't have, then return a 400 and an error message

# class Application
 
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
 
#     if req.path=="/songs"
#       resp.write "You requested the songs"
#     else
#       resp.write "Route not found"
#       resp.status = 404
#     end
 
#     resp.finish
#   end
# end

# class Application #dynamic routes
 
#   @@songs = [Song.new("Sorry", "Justin Bieber"),
#             Song.new("Hello","Adele")]
 
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
 
#     if req.path.match(/songs/)
 
#       song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
#       song = @@songs.find{|s| s.title == song_title}
 
#       resp.write song.artist
#     end
 
#     resp.finish
#   end
# end


# class Application
 
#   @@items = ["Apples","Carrots","Pears"]
 
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
 
#     if req.path.match(/items/)
#       @@items.each do |item|
#         resp.write "#{item}\n"
#       end
#     elsif req.path.match(/search/)
 
#       search_term = req.params["q"]
 
#       if @@items.include?(search_term)
#         resp.write "#{search_term} is one of our items"
#       else
#         resp.write "Couldn't find #{search_term}"
#       end
 
#     else
#       resp.write "Path Not Found"
#     end
 
#     resp.finish
#   end
# end
