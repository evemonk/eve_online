# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseType < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v3/universe/types/%<type_id>s/?datasource=%<datasource>s'

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
        Models::Type.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, type_id: id, datasource: datasource)
      end
    end
  end
end
