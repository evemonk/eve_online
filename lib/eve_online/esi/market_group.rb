# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class MarketGroup < Base
      extend Forwardable

      API_PATH = "/v1/markets/groups/%<market_group_id>s/"

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :description, :market_group_id, :name,
        :parent_group_id, :type_ids

      def model
        @model ||= Models::MarketGroup.new(response)
      end

      def scope
      end

      def path
        format(API_PATH, market_group_id: id)
      end
    end
  end
end
