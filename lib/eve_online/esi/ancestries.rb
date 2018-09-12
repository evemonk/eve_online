# frozen_string_literal: true

module EveOnline
  module ESI
    class Ancestries < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/ancestries/?datasource=%<datasource>s&language=en-us'

      def ancestries
        output = []
        response.each do |ancestry|
          output << Models::Ancestry.new(ancestry)
        end
        output
      end
      memoize :ancestries

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end
