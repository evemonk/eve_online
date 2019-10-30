# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseMoon < Base
      extend Forwardable

      API_PATH = '/v1/universe/moons/%<moon_id>s/'

      attr_reader :id

      def initialize(options = {})
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :moon_id, :name, :system_id, :position

      def model
        @model ||= Models::Moon.new(response)
      end

      def scope; end

      def path
        format(API_PATH, moon_id: id)
      end
    end
  end
end
