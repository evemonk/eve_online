# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseType < Base
      extend Forwardable

      API_PATH = '/v3/universe/types/%<type_id>s/'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :capacity, :description, :graphic_id,
                     :group_id, :icon_id, :market_group_id, :mass, :name,
                     :packaged_volume, :portion_size, :published, :radius,
                     :type_id, :volume, :dogma_attributes, :dogma_effects

      def model
        @model ||= Models::Type.new(response)
      end

      def scope; end

      def additional_query_params
        [:language]
      end

      def path
        format("#{ API_PATH }", type_id: id)
      end
    end
  end
end
