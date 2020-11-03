module Rack
  class JSONBodyParser
    module Controls
      module Application
        def self.example
          instance = Example.new
          instance.configure
          instance
        end

        class Example
          include Dependency

          dependency :telemetry, ::Telemetry

          def configure
            ::Telemetry.configure(self)
          end

          def call(env)
            telemetry.record :application_called
          end

          module Telemetry
            class Sink
              include ::Telemetry::Sink

              record :application_called
            end

            def self.sink
              Sink.new
            end
          end

          def self.register_telemetry_sink(receiver)
            sink = Telemetry.sink
            receiver.telemetry.register(sink)
            sink
          end
        end
      end
    end
  end
end
