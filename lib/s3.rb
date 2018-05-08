module DTKModule
  require_relative('../../aws_stdlib/lib/aws_stdlib')
  module Aws::S3
    require_relative('s3/file')
  end
end
