module Rack
  class JSONBodyParser
    module Controls
      module Request
        module Get
          def self.example
            env = {}
            env["PATH_INFO"] = ""
            env["SCRIPT_NAME"] = ""
            env["REQUEST_METHOD"] = "GET"
            env["rack.input"] = StringIO.new

            env
          end
        end

        module Post
          def self.example
            env = {}
            env["PATH_INFO"] = ""
            env["SCRIPT_NAME"] = ""
            env["REQUEST_METHOD"] = "POST"
            env["CONTENT_TYPE"] = "application/json"
            env["rack.input"] = StringIO.new(data.to_json)

            env
          end

          def self.data
            { "test" => "test data" }
          end

          module WrongContentType
            def self.example
              env = {}
              env["PATH_INFO"] = ""
              env["SCRIPT_NAME"] = ""
              env["REQUEST_METHOD"] = "POST"
              env["CONTENT_TYPE"] = "text/plain"
              env["rack.input"] = StringIO.new

              env
            end
          end

          module Invalid
            def self.example
              env = {}
              env["PATH_INFO"] = ""
              env["SCRIPT_NAME"] = ""
              env["REQUEST_METHOD"] = "POST"
              env["CONTENT_TYPE"] = "application/json"
              env["rack.input"] = StringIO.new(data)

              env
            end

            def self.data
              "{badjson}"
            end
          end
        end
      end
    end
  end
end
