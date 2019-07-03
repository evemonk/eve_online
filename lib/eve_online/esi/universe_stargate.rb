# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseStargate < Base
      extend Forwardable

      API_PATH = '/v1/universe/stargates/%<stargate_id>s/'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :name, :stargate_id, :system_id,
                     :type_id, :destination, :position

      def model
        @model ||= Models::Stargate.new(response)
      end

      def scope; end

      def path
        format("#{ API_PATH }", stargate_id: id)
      end
    end
  end
end
