# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseGraphic < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/graphics/%<graphic_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :collision_file, :graphic_file,
                     :graphic_id, :icon_folder, :sof_dna, :sof_fation_name,
                     :sof_hull_name, :sof_race_name

      def model
        @model ||= Models::Graphic.new(response)
      end

      def scope; end

      def url
        format(API_ENDPOINT, graphic_id: id, datasource: datasource)
      end
    end
  end
end
