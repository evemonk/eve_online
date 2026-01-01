# frozen_string_literal: true

module EveOnline
  module ESI
    class Collection
      include Enumerable

      attr_reader :data

      def self.from_response(response, type:)
        body = response.body

        new(data: body.map {|attributes| type.new(attributes: attributes)})
      end

      def initialize(data:)
        @data = data
      end

      def each(&block)
        return enum_for(:each) unless block_given?

        data.each(&block)
      end

      def size
        data.size
      end
    end
  end
end
