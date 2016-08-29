module EveOnline
  module SDE
    class TypeIDs
      attr_reader :file

      def initialize(file)
        @file = file
      end

      def content
        @content ||= YAML.load(File.open(file))
      end
    end
  end
end
