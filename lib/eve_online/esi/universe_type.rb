# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseType < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v3/universe/types/%<type_id>s/?datasource=%<datasource>s&language=en-us'

      attr_reader :type_id

      def initialize(options)
        super

        @type_id = options[:type_id]
      end

      def_delegators :model, :as_json, :name, :description,
                     :published, :group_id, :market_group_id, :radius, :volume,
                     :packaged_volume, :icon_id, :capacity, :portion_size,
                     :mass, :graphic_id

      def model
        Models::Type.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, type_id: type_id, datasource: datasource)
      end
    end
  end
end
