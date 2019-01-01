# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseStar < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/stars/%<star_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :age, :luminosity, :name, :radius,
                     :solar_system_id, :spectral_class, :temperature,
                     :type_id

      def model
        @model ||= Models::Star.new(response)
      end

      def scope; end

      def url
        format(API_ENDPOINT, star_id: id, datasource: datasource)
      end
    end
  end
end
