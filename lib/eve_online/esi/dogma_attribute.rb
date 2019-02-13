# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class DogmaAttribute < Base
      extend Forwardable

      API_PATH = '/v1/dogma/attributes/%<attribute_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :attribute_id, :default_value,
                     :description, :display_name, :high_is_good, :icon_id,
                     :name, :published, :stackable, :unit_id

      def model
        @model ||= Models::DogmaAttribute.new(response)
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", attribute_id: id, datasource: datasource)
      end
    end
  end
end
