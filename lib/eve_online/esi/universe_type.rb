# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class UniverseType < Base
      extend Forwardable

      API_PATH = "/v3/universe/types/%<type_id>s/"

      attr_reader :type_id

      def initialize(options)
        super

        @type_id = options.fetch(:type_id)
      end

      def_delegators :model, :as_json, :capacity, :description, :graphic_id,
        :group_id, :icon_id, :market_group_id, :mass, :name, :packaged_volume,
        :portion_size, :published, :radius, :id, :volume,
        :dogma_attributes, :dogma_effects

      def model
        @model ||= Models::Type.new(response)
      end

      def scope
      end

      def additional_query_params
        [:language]
      end

      def path
        format(API_PATH, type_id: type_id)
      end
    end
  end
end
