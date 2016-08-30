module EveOnline
  module SDE
    class Blueprints
      attr_reader :file

      def initialize(file)
        @file = file
      end

      def blueprints
        @type_ids ||= begin
          output = []
          content.each do |entry|
            output << Blueprint.new(entry)
          end
          output
        end
      end

      def content
        @content ||= YAML.load(File.open(file))
      end
    end
  end
end
