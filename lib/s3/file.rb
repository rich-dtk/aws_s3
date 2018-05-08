module DTKModule
  module Aws::S3
    class File < Aws::Stdlib::Resource
      require_relative('file/operation')

      # opts can have keys
      #   :credentials_handle - if not given means to use the node's instance profile
      def self.get_file_content(bucket, file_path, opts = {})
        create(dtk_all_attributes(bucket, file_path, credentials_handle: opts[:credentials_handle])).get_file_content
      end

      def get_file_content
        aws_api_operation(:get).get_file_content
      end

      private

      def aws_client_class
         ::Aws::S3::Client
      end

      #   :credentials_handle - if not given means to use the node's instance profile
      def self.dtk_all_attributes(bucket, file_path, opts = {})
        component_av_hash  = {
          name: "#{bucket}-#{file_path}", # need to be given to use the Aws::Stdlib::Resource apis, but not used in processing
          bucket: bucket,
          file_path: file_path,
          credentials_handle: opts[:credentials_handle]
        }
        DTK::Attributes::AllTypes.new(component: component_av_hash, attributes_class: Aws::Stdlib::Attributes)
      end
    end
  end
end
