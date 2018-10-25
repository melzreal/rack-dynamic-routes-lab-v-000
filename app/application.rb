class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      if item.empty?
        resp.write "Route not found"
        resp.status = 404
      elsif !item.empty?
        resp.write "You requested #{item.price}"
      else
        resp.write "Route not found"
        resp.status = 404
      end
    end

    resp.finish
  end
end
