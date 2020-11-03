module Rack
  class JSONBodyParser
    module Controls
      module Parse
        module Status
          def self.call(response)
            response[0]
          end
        end

        module Header
          def self.call(response, key)
            response[1][key]
          end
        end

        module Body
          def self.call(response)
            s = String.new
            b = response[2]
            b.each{|x| s << x}
            b.close if b.respond_to?(:close)
            s
          end
        end
      end
    end
  end
end
