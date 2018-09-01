# frozen_string_literal: true

module EveOnline
  module ESI
    class Bloodlines < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/bloodlines/?datasource=%<datasource>s&language=en-us'

      def bloodlines
        output = []
        response.each do |bloodline|
          output << Models::Bloodline.new(bloodline)
        end
        output
      end
      memoize :bloodlines

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end
