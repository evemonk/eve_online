module EveOnline
  module SDE
    class Base
      attr_reader :file

      def initialize(file)
        @file = file
      end

      def file_content
        @content ||= File.read(file)
      end

      def original_data
        @original_data ||= YAML.load(file_content)
      end
    end
  end
end
