# frozen_string_literal: true

module EveOnline
  module ESI
    class DogmaAttributes < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/dogma/attributes/?datasource=%<datasource>s'

      def attributes
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end
