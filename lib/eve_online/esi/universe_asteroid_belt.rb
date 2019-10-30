# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseAsteroidBelt < Base
      extend Forwardable

      API_PATH = '/v1/universe/asteroid_belts/%<asteroid_belt_id>s/'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :name, :system_id, :position

      def model
        @model ||= Models::AsteroidBelt.new(response)
      end

      def scope; end

      def path
        format(API_PATH, asteroid_belt_id: id)
      end
    end
  end
end
