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
          max_production_limit: max_production_limit,
          activities: activities
        }
      end

      def type_id
        options.fetch('blueprintTypeID')
      end

      def max_production_limit
        options.fetch('maxProductionLimit')
      end

      def activities
        options.fetch('activities')
      end
    end
  end
end
