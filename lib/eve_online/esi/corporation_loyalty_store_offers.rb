# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationLoyaltyStoreOffers < Base
      API_PATH = '/v1/loyalty/stores/%<corporation_id>s/offers/?datasource=%<datasource>s'

      attr_reader :corporation_id

      def initialize(options = {})
        super

        @corporation_id = options.fetch(:corporation_id)
      end

      def offers
        @offers ||=
          begin
            output = []
            response.each do |offer|
              output << Models::LoyaltyStoreOffer.new(offer)
            end
            output
          end
      end

      def scope; end

      def roles
        []
      end

      def url
        format("#{ API_HOST }#{ API_PATH }", corporation_id: corporation_id, datasource: datasource)
      end
    end
  end
end
