require 'forwardable'

module EveOnline
  module ESI
    class DogmaAttribute < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/dogma/attributes/%s/?datasource=tranquility'.freeze

      attr_reader :attribute_id

      def initialize(options)
        super

        @attribute_id = options[:attribute_id]
      end

      def_delegators :model, :as_json, :id, :name, :description, :icon_id,
                     :default_value, :published, :display_name, :unit_id,
                     :stackable, :high_is_good

      def model
        Models::DogmaAttribute.new(response)
      end
      memoize :model

      def scope; end

      def url
        API_ENDPOINT % attribute_id
      end
    end
  end
end
