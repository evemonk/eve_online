# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseAncestries < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/ancestries/?datasource=%<datasource>s'

      def ancestries
        @ancestries ||=
          begin
            output = []
            response.each do |ancestry|
              output << Models::Ancestry.new(ancestry)
            end
            output
          end
      end

      def etag
        current_etag
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end
