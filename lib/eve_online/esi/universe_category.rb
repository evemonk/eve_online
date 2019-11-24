# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class UniverseCategory < Base
      extend Forwardable

      API_PATH = "/v1/universe/categories/%<category_id>s/"

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

      def scope
      end

      def additional_query_params
        [:language]
      end

      def path
        format(API_PATH, category_id: id)
      end
    end
  end
end
