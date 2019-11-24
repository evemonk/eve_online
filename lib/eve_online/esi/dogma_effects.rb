# frozen_string_literal: true

module EveOnline
  module ESI
    class DogmaEffects < Base
      API_PATH = "/v1/dogma/effects/"

      def effect_ids
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
