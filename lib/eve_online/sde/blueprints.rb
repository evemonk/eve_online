require 'yaml'
require 'memoist'

module EveOnline
  module SDE
    class Blueprints
      extend Memoist

      attr_reader :file

      def initialize(file)
        @file = file
      end

      def blueprints
        output = []
        content.each do |entry|
          output << Blueprint.new(entry)
        end
        output
      end
      memoize :blueprints

      def content
        YAML.load(File.open(file))
      end
      memoize :content
    end
  end
end
