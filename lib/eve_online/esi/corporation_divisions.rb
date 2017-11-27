module EveOnline
  module ESI
    class CorporationDivisions < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/corporations/%s/divisions/?datasource=tranquility'.freeze

      attr_reader :corporation_id

      def initialize(options)
        super

        @corporation_id = options[:corporation_id]
      end

      def divisions
        Models::Division.new(response)
      end
      memoize :divisions

      def scope
        'esi-corporations.read_divisions.v1'
      end

      def url
        API_ENDPOINT % corporation_id
      end
    end
  end
end
