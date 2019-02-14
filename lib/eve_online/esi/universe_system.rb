# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseSystem < Base
      extend Forwardable

      API_PATH = '/v4/universe/systems/%<system_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :constellation_id, :name,
                     :security_class, :security_status, :star_id, :system_id,
                     :position, :planets, :stargate_ids, :station_ids

      def model
        @model ||= Models::System.new(response)
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", system_id: id, datasource: datasource)
      end
    end
  end
end
