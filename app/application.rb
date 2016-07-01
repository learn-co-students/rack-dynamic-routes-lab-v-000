class Application
  attr_accessor :resp, :req

  def initialize
    @resp
  end

  def call(env)
    self.resp = Rack::Response.new
    self.req  = Rack::Request.new(env)
    
    create_response
  end

  def req_path_includes_items
    item_name = req.path.split("/items/").last
    item = Item.item_list.find { |item| item.name == item_name }

    if item
      resp.write item.price
      resp.status = 200
    else
      resp.write "Item not found"
      resp.status = 400
    end
  end

  def create_response
    if req.path.match(/items/)
      req_path_includes_items
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
