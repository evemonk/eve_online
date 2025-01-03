# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class UniverseGroup < Base
      extend Forwardable

      API_PATH = "/v1/universe/groups/%<group_id>s/"

      attr_reader :group_id

      def initialize(options = {})
        super

        @group_id = options.fetch(:group_id)
      end

      def_delegators :model, :as_json, :category_id, :id, :name,
        :published, :type_ids

      def model
        @model ||= Models::Group.new(response)
      end

      def scope
      end

      def additional_query_params
        [:language]
      end

      def path
        format(API_PATH, group_id: group_id)
      end
    end
  end
end
