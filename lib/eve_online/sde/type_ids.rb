module EveOnline
  module SDE
    class TypeIDs
      attr_reader :file

      def initialize(file)
        @file = file
      end

      def type_ids
        @type_ids ||= begin
          output = []
          content.each do |entry|
            output << TypeID.new(entry)
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
