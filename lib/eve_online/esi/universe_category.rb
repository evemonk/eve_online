# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseCategory < Base
      extend Forwardable

      API_PATH = '/v1/universe/categories/%<category_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :category_id, :name, :published,
                     :group_ids

      def model
        @model ||= Models::Category.new(response)
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", category_id: id, datasource: datasource)
      end
    end
  end
end
