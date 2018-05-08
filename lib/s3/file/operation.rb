module DTKModule
  module Aws::S3
    class File
      class Operation < Aws::Stdlib::Resource::Operation
        OPERATIONS = [:get]
        OPERATIONS.each { |operation_name| require_relative("operation/#{operation_name}") }

        private

        def self.resource_class
          File
        end

      end
    end
  end
end
