# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class Alliance < Base
      extend Forwardable

      API_PATH = '/v3/alliances/%<alliance_id>s/'

      attr_reader :alliance_id

      def initialize(options)
        super

        @alliance_id = options.fetch(:alliance_id)
      end

      def_delegators :model, :as_json, :creator_corporation_id, :creator_id,
                     :date_founded, :executor_corporation_id, :faction_id,
                     :name, :ticker

      def model
        @model ||= Models::Alliance.new(response)
      end

      def scope; end

      def path
        format("#{ API_PATH }", alliance_id: alliance_id)
      end
    end
  end
end
