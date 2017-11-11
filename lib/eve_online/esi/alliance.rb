require 'forwardable'

module EveOnline
  module ESI
    class Alliance < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/alliances/%s/?datasource=tranquility'.freeze

      attr_reader :alliance_id

      def initialize(options)
        super

        @alliance_id = options[:alliance_id]
      end

      def_delegators :model, :as_json, :alliance_name,
                     :ticker, :date_founded, :executor_corp

      def model
        Models::Alliance.new(response)
      end
      memoize :model

      def scope; end

      def url
        API_ENDPOINT % alliance_id
      end
    end
  end
end
