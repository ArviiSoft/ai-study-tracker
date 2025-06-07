require "rack"

module MiniWeb
  class App
    def initialize
      @routes = {}
    end

    def get(path, &block)
      (@routes["GET"] ||= {})[path] = block
    end

    def post(path, &block)
      (@routes["POST"] ||= {})[path] = block
    end

    def call(env)
      req = Rack::Request.new(env)
      res = Rack::Response.new

      route = @routes[req.request_method][req.path_info] rescue nil
      if route
        route.call(req, res)
      else
        res.status = 404
        res.write "404 Not Found"
      end

      res.finish
    end
  end
end