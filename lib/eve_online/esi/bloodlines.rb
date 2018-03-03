# frozen_string_literal: true

module EveOnline
  module ESI
    class Bloodlines < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/universe/bloodlines/?datasource=tranquility&language=en-us'.freeze

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
        API_ENDPOINT
      end
    end
  end
end
