# frozen_string_literal: true

module EveOnline
  module ESI
    class Wars < Base
      API_PATH = '/v1/wars/'

      attr_reader :max_war_id

      def initialize(options = {})
        super

        @max_war_id = options.fetch(:max_war_id, nil)
      end

      def war_ids
        response
      end

      def scope; end

      # TODO: check this crap
      def additation_query_params
        [:max_war_id]
      end

      def path
        API_PATH
      end
    end
  end
end
