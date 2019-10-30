# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseGraphic < Base
      extend Forwardable

      API_PATH = '/v1/universe/graphics/%<graphic_id>s/'

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

      def path
        format(API_PATH, graphic_id: id)
      end
    end
  end
end
