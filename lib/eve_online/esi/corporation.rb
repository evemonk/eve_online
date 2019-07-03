# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class Corporation < Base
      extend Forwardable

      API_PATH = '/v4/corporations/%<corporation_id>s/'

      attr_reader :corporation_id

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
      end

      def_delegators :model, :as_json, :alliance_id, :ceo_id, :creator_id,
                     :date_founded, :description, :faction_id,
                     :home_station_id, :member_count, :name, :shares,
                     :tax_rate, :ticker, :corporation_url, :war_eligible

      def model
        @model ||= Models::Corporation.new(response)
      end

      def scope; end

      def path
        format("#{ API_PATH }", corporation_id: corporation_id)
      end
    end
  end
end
