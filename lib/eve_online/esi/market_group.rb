# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class MarketGroup < Base
      extend Forwardable

      API_PATH = "/v1/markets/groups/%<market_group_id>s/"

      attr_reader :market_group_id

      def initialize(options)
        super

        @market_group_id = options.fetch(:market_group_id)
      end

      def_delegators :model, :as_json, :description, :id, :name,
        :parent_group_id, :type_ids

      def model
        @model ||= Models::MarketGroup.new(response)
      end

      def scope
      end

      def additional_query_params
        [:language]
      end

      def path
        format(API_PATH, market_group_id: market_group_id)
      end
    end
  end
end
