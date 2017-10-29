class Application

  def call(env)
    @resp = Rack::Response.new
    @req = Rack::Request.new(env)

    if @req.path.match(/items/)
      show_the_price
    else
      @resp.write "Route not found"
      @resp.status = 404
    end

    def show_the_price
      get_item_instance
      if @item_instance
        @resp.write @item_instance.price
      else
        @resp.write "Item not found"
        @resp.status = 400
      end
    end

    def get_item_instance
      requested_item = @req.path.split("/items/").last
      @item_instance = Item.all.find {|i| i.name == requested_item}
    end

    @resp.finish

  end

end
