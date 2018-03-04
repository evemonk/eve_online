# frozen_string_literal: true

module EveOnline
  module ESI
    class DogmaAttributes < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/dogma/attributes/?datasource=tranquility'

      def attributes
        response
      end

      def scope; end

      def url
        API_ENDPOINT
      end
    end
  end
end
