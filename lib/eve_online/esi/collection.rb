# frozen_string_literal: true

module EveOnline
  module ESI
    class Collection
      include Enumerable
      include ParsedHeaders

      extend Forwardable

      attr_reader :data, :headers

      def_delegators :data, :size, :first, :last

      def self.from_response(response, type:)
        body = response.body

        new(
          data: body.map { |attributes| type.new(attributes: attributes) },
          headers: response.headers
        )
      end

      def initialize(data:, headers:)
        @data = data
        @headers = headers
      end

      def each(&block)
        return enum_for(:each) unless block_given?

        data.each(&block)
      end
    end
  end
end
