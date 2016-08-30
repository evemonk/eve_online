module EveOnline
  module SDE
    class Blueprint
      attr_reader :options

      def initialize(options)
        @options = options
      end

      def as_json
        {
          type_id: type_id,
          data: data
        }
      end

      def type_id
        @type_id ||= options.first
      end

      def data
        @data ||= options.last
      end
    end
  end
end
