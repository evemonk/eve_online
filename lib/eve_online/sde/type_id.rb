module EveOnline
  module SDE
    class TypeID
      attr_reader :options

      def initialize(options)
        @options = options
      end

      def type_id
        @type_id ||= options.first
      end

      def data
        @data ||= options.last
      end

      def as_json
        {
          type_id: type_id,
          data: data
        }
      end
    end
  end
end
