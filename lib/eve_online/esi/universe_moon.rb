# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class UniverseMoon < Base
      extend Forwardable

      API_PATH = "/v1/universe/moons/%<moon_id>s/"

      attr_reader :moon_id

      def initialize(options = {})
        super

        @moon_id = options.fetch(:moon_id)
      end

      def_delegators :model, :as_json, :id, :name, :system_id, :position

      def model
        @model ||= Models::Moon.new(response)
      end

      def scope
      end

      def path
        format(API_PATH, moon_id: moon_id)
      end
    end
  end
end
