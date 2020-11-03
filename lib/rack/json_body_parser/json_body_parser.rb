module Rack
  class JSONBodyParser
    def initialize(app, namespace)
      @app = app
      @namespace = namespace
    end

    def call(env)
      if env[Rack::REQUEST_METHOD] != "POST"
        @app.(env)
      end

      if env["CONTENT_TYPE"] != "application/json"
        return error_response
      end

      begin
        body = env[Rack::RACK_INPUT]
        body_content = body.read
        body.rewind

        message = JSON.parse(body_content, create_additions: false)

        env.update(@namespace => message)
      rescue JSON::ParserError
        return error_response
      end

      @app.(env)
    end

    def error_response
      body = { "error" => "Failed to parse body as JSON." }.to_json
      header = { "Content-Type" => "application/json" }
      Rack::Response.new(body, 400, header).finish
    end
  end
end
