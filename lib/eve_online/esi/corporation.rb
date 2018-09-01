# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class Corporation < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v4/corporations/%<corporation_id>s/?datasource=%<datasource>s'

      attr_reader :corporation_id

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
      end

      def_delegators :model, :as_json, :alliance_id, :ceo_id, :creator_id,
                     :date_founded, :description, :faction_id,
                     :home_station_id, :member_count, :name, :shares,
                     :tax_rate, :ticker, :corporation_url

      def model
        Models::Corporation.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, corporation_id: corporation_id, datasource: datasource)
      end
    end
  end
end
