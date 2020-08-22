# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationMembers < Base
      API_PATH = "/v3/corporations/%<corporation_id>s/members/"

      attr_reader :corporation_id

      def initialize(options = {})
        super

        @corporation_id = options.fetch(:corporation_id)
      end

      def character_ids
        response
      end

      def scope
        "esi-corporations.read_corporation_membership.v1"
      end

      def path
        format(API_PATH, corporation_id: corporation_id)
      end
    end
  end
end
