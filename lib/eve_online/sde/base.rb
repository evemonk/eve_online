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

      # def original_data
      #   @original_data ||= YAML.load(content)
      # end
      #
      # def data
      #   @data ||= original_data.map { |a| a.transform_keys { |k| k.underscore } }
      # end
    end
  end
end
