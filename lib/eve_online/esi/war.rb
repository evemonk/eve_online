# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class War < Base
      extend Forwardable

      API_PATH = '/v1/wars/%<war_id>s/'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :declared, :finished, :war_id, :mutual,
                     :open_for_allies, :retracted, :started, :aggressor,
                     :allies, :defender

      def model
        @model ||= Models::War.new(response)
      end

      def scope; end

      def path
        format("#{ API_PATH }", war_id: id)
      end
    end
  end
end
