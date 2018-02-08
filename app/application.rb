class Application

  def call(env)
    if req.path=="/items"



    else
      resp.write "Route not found"
      resp.status = 404

    end


  resp.finish
  end
end
