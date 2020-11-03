module Rack
  class JSONBodyParser
    module Controls
      module Middleware
        def self.example(app=nil, namespace=nil)
          middleware = Rack::JSONBodyParser.new(app, namespace)
          middleware
        end
      end
    end
  end
end
