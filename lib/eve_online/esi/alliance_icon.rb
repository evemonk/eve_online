# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class AllianceIcon < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/alliances/%<alliance_id>s/icons/?datasource=tranquility'

      attr_reader :alliance_id

      def initialize(options)
        super

        @alliance_id = options[:alliance_id]
      end

      def_delegators :model, :as_json, :small, :medium

      def model
        Models::AllianceIcon.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, alliance_id: alliance_id)
      end
    end
  end
end
