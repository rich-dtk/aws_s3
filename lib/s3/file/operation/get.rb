module DTKModule
  module Aws::S3
    class File::Operation
      class Get < self
        class InputSettings < DTK::Settings
          REQUIRED = [:bucket, :file_path]
        end

        def get_file_content
          aws_get_object(params.bucket, params.file_path).body.read
        end

        private

        def aws_get_object(bucket, file_path)
          begin 
            client.get_object(bucket: bucket, key: file_path)
          rescue => e
            fail "S3 error for get_object with bucket '#{bucket}' and file '#{file_path}': #{e.message}"
          end
        end

      end
    end
  end
end
