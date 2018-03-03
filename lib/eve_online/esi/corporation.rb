# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class Corporation < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v4/corporations/%<corporation_id>s/?datasource=tranquility'.freeze

      attr_reader :corporation_id

      def initialize(options)
        super

        @corporation_id = options[:corporation_id]
      end

      def_delegators :model, :as_json, :name, :ticker, :member_count, :ceo_id,
                     :alliance_id, :description, :tax_rate, :date_founded,
                     :creator_id, :corporation_url, :faction_id,
                     :home_station_id, :shares

      def model
        Models::Corporation.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, corporation_id: corporation_id)
      end
    end
  end
end
