require 'memoist'

module EveOnline
  module SDE
    class Base
      extend Memoist

      attr_reader :file

      def initialize(file)
        @file = file
      end

      def content
        @content ||= File.read(file)
      end

      def data
        @data ||= YAML.load(content)
      end
    end
  end
end
