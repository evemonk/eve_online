# frozen_string_literal: true

require "ostruct"

module EveOnline
  module ESI
    class Object
      include ParsedHeaders

      attr_reader :attributes, :body, :headers

      # @param attributes [Hash | NilClass]
      # @param body [Array<Integer> | NilClass]
      # @param headers [Hash | NilClass]
      def initialize(attributes: nil, body: nil, headers: nil)
        @attributes = OpenStruct.new(attributes)
        @body = body
        @headers = headers
      end

      def method_missing(method, *args, &block)
        attribute = @attributes.public_send(method, *args, &block)
        attribute.is_a?(Hash) ? Object.new(attribute) : attribute
      end

      def respond_to_missing?(_, _ = false)
        true
      end
    end
  end
end
