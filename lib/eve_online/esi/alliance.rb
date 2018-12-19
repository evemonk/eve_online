# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class Alliance < Base
      extend Forwardable

      include ResponseWithEtag

      API_ENDPOINT = 'https://esi.evetech.net/v3/alliances/%<alliance_id>s/?datasource=%<datasource>s'

      attr_reader :alliance_id

      def initialize(options)
        super

        @alliance_id = options.fetch(:alliance_id)
      end

      def_delegators :model, :as_json, :creator_corporation_id, :creator_id,
                     :date_founded, :executor_corporation_id, :faction_id,
                     :name, :ticker, :etag

      def model
        @model ||= Models::Alliance.new(response_with_etag)
      end

      def scope; end

      def url
        format(API_ENDPOINT, alliance_id: alliance_id, datasource: datasource)
      end
    end
  end
end
