# frozen_string_literal: true

require "ostruct"

module EveOnline
  module ESI
    class Object
      attr_reader :attributes, :headers

      # @param attributes [Hash]
      def initialize(attributes:, headers:)
        @attributes = OpenStruct.new(attributes)
        @headers = headers
      end

      def request_id
        headers["x-esi-request-id"]
      end

      def ratelimit_remaining
        headers["x-ratelimit-remaining"]&.to_i
      end

      def ratelimit_used
        headers["x-ratelimit-used"]&.to_i
      end

      def method_missing(method, *args, &block)
        attribute = @attributes.public_send(method, *args, &block)
        attribute.is_a?(Hash) ? Object.new(attribute) : attribute
      end

      def respond_to_missing?(_method, _include_private = false)
        true
      end
    end
  end
end
