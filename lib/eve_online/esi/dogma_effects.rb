# frozen_string_literal: true

module EveOnline
  module ESI
    class DogmaEffects < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/dogma/effects/?datasource=%<datasource>s'

      def effects_ids
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end
