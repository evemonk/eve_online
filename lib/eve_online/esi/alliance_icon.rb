# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class AllianceIcon < Base
      extend Forwardable

      API_PATH = "/v2/alliances/%<alliance_id>s/icons/"

      attr_reader :alliance_id

      def initialize(options)
        super

        @alliance_id = options.fetch(:alliance_id)
      end

      def_delegators :model, :as_json, :icon_small, :icon_medium

      def model
        @model ||= Models::AllianceIcon.new(response)
      end

      def scope
      end

      def path
        format(API_PATH, alliance_id: alliance_id)
      end
    end
  end
end
