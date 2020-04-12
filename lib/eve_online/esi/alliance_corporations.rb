# frozen_string_literal: true

module EveOnline
  module ESI
    class AllianceCorporations < Base
      API_PATH = "/v2/alliances/%<alliance_id>s/corporations/"

      attr_reader :alliance_id

      def initialize(options)
        super

        @alliance_id = options.fetch(:alliance_id)
      end

      def corporation_ids
        response
      end

      def scope
      end

      def path
        format(API_PATH, alliance_id: alliance_id)
      end
    end
  end
end
