# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationNPC < Base
      API_PATH = "/v1/corporations/npccorps/"

      def corporation_npc_ids
        response
      end

      def scope
      end

      def path
        API_PATH
      end
    end
  end
end
