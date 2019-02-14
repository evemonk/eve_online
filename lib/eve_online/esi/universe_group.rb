# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseGroup < Base
      extend Forwardable

      API_PATH = '/v1/universe/groups/%<group_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options = {})
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :category_id, :group_id, :name,
                     :published, :type_ids

      def model
        @model ||= Models::Group.new(response)
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", group_id: id, datasource: datasource)
      end
    end
  end
end
