# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class Collection
      include Enumerable
      include ParsedHeaders

      extend Forwardable

      attr_reader :data, :headers

      def_delegators :data, :size, :first, :last, :each

      def self.from_response(response, type:)
        body = response.body

        new(
          data: body.map { |attributes| type.new(attributes: attributes) },
          headers: response.headers
        )
      end

      def self.from_array(array, type:)
        new(data: array.map { |attributes| type.new(attributes: attributes) })
      end

      def initialize(data:, headers: nil)
        @data = data
        @headers = headers
      end
    end
  end
end
