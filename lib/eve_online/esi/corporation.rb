require 'forwardable'

module EveOnline
  module ESI
    class Corporation < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/latest/corporations/%s/?datasource=tranquility'.freeze

      attr_reader :corporation_id

      def initialize(options)
        super

        @corporation_id = options[:corporation_id]
      end

      def_delegators :model, :as_json, :alliance_id, :ceo_id,
                     :corporation_description, :corporation_description,
                     :corporation_name, :creation_date, :creator_id, :faction,
                     :faction, :member_count, :tax_rate, :ticker,
                     :corporation_url

      def model
        Models::Corporation.new(response)
      end
      memoize :model

      def scope; end

      def url
        API_ENDPOINT % corporation_id
      end
    end
  end
end
