# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class AllianceIcon < Base
      extend Forwardable

      API_PATH = '/v1/alliances/%<alliance_id>s/icons/?datasource=%<datasource>s'

      attr_reader :alliance_id

      def initialize(options)
        super

        @alliance_id = options.fetch(:alliance_id)
      end

      def_delegators :model, :as_json, :icon_small, :icon_medium

      def model
        @model ||= Models::AllianceIcon.new(response)
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", alliance_id: alliance_id, datasource: datasource)
      end
    end
  end
end
